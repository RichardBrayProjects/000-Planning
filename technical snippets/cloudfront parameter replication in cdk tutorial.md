Got it 👍 thanks for the detailed context. Let me break this down.

---

## 1. Does CloudFront have to be deployed in **us-east-1**?

Yes ✅.
CloudFront is **global**, but the control plane (where the distribution lives) is anchored in `us-east-1`.
That means your `Distribution` resource always exists in `us-east-1`.
So your CDK stack that creates CloudFront must be deployed in `us-east-1`.

---

## 2. Where are your SSM parameters written?

Right now, your `CloudFrontStack` writes SSM parameters in `us-east-1` (the same region as the stack).
But you want those **same values** available in `eu-west-2`, because your later stacks (RDS, Cognito, etc.) run there.

---

## 3. How to replicate **without bash scripts**?

You can do this **entirely inside CDK**, by making your stack write the same parameter in **both regions**.

CDK lets you do this with **cross-region SSM parameters** by creating a `CustomResource` Lambda that writes to another region, or more simply, by creating **a second stack** just for replication.

### Two Stacks in CDK (cleaner with pnpm workspaces)

Define:

1. `CloudFrontStack` in `us-east-1` (creates CloudFront + SSM params).
2. `CloudFrontReplicationStack` in `eu-west-2` (reads values from `us-east-1` as CFN outputs and re-creates SSM parameters in `eu-west-2`).

That way, everything is CDK-native, no scripts.

---

## 4. Example: Two-stack approach

```ts
// cloudfrontStack.ts (us-east-1)
export class CloudFrontStack extends Stack {
  public readonly distribution: Distribution;
  public readonly bucket: Bucket;

  constructor(scope: Construct, id: string, props: CloudFrontStackProps) {
    super(scope, id, props);

    // ... your existing code ...

    new CfnOutput(this, 'CloudFrontDistributionUrl', {
      value: `https://${this.distribution.distributionDomainName}`,
      exportName: `CloudFrontDistributionUrl-${props.universe}`,
    });

    new CfnOutput(this, 'CloudFrontDistributionId', {
      value: this.distribution.distributionId,
      exportName: `CloudFrontDistributionId-${props.universe}`,
    });

    new CfnOutput(this, 'CloudFrontBucketName', {
      value: this.bucket.bucketName,
      exportName: `CloudFrontBucketName-${props.universe}`,
    });
  }
}
```

```ts
// cloudfrontReplicationStack.ts (eu-west-2)
import { Stack, StackProps, CfnOutput, Fn } from 'aws-cdk-lib';
import { Construct } from 'constructs';
import { StringParameter } from 'aws-cdk-lib/aws-ssm';

interface CloudFrontReplicationProps extends StackProps {
  universe: string;
}

export class CloudFrontReplicationStack extends Stack {
  constructor(scope: Construct, id: string, props: CloudFrontReplicationProps) {
    super(scope, id, props);

    const { universe } = props;

    const distUrl = Fn.importValue(`CloudFrontDistributionUrl-${universe}`);
    const distId = Fn.importValue(`CloudFrontDistributionId-${universe}`);
    const bucketName = Fn.importValue(`CloudFrontBucketName-${universe}`);

    new StringParameter(this, 'CFDistUrlParam', {
      parameterName: `/cloudfront/uptick/distribution-url`,
      stringValue: distUrl,
    });

    new StringParameter(this, 'CFDistIdParam', {
      parameterName: `/cloudfront/uptick/distribution-id`,
      stringValue: distId,
    });

    new StringParameter(this, 'CFBucketParam', {
      parameterName: `/cloudfront/uptick/bucket-name`,
      stringValue: bucketName,
    });

    new CfnOutput(this, 'ReplicationComplete', {
      value: 'done',
    });
  }
}
```

```ts
// bin/cloudfront.ts
import * as cdk from 'aws-cdk-lib';
import accountDict from '../utils/accountDict';
import { CloudFrontStack } from '../lib/cloudfrontStack';
import { CloudFrontReplicationStack } from '../lib/cloudfrontReplicationStack';

const app = new cdk.App();
const universe = process.env.UNIVERSE!;
const account = accountDict[universe].id;

const cfStack = new CloudFrontStack(app, 'system-cloudfront', {
  env: { account, region: 'us-east-1' },
  universe,
});

new CloudFrontReplicationStack(app, 'system-cloudfront-replication', {
  env: { account, region: 'eu-west-2' },
  universe,
});
```

---

## 5. Deployment with pnpm

Now your `pnpm run deploy-cloudfront` can simply do:

```json
"scripts": {
  "deploy-cloudfront": "cdk deploy system-cloudfront system-cloudfront-replication --require-approval never --app 'tsx ./src/bin/cloudfront.ts'"
}
```

No bash scripts needed ✅.

---

## 6. Summary

- CloudFront must be deployed in `us-east-1`.
- Use **a second CDK stack** in `eu-west-2` to replicate SSM params.
- Deploy both stacks together with `pnpm run deploy-cloudfront`.
- This removes the need for `cloudfront-ssm-replication.sh`.

---

Would you like me to refactor your `deploy-cloudfront.sh` → `package.json` so it only runs `pnpm cdk deploy` (no shell scripts at all), using the two-stack approach above?
