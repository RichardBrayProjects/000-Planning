
# create an access key for the dev user

- login as IAM dev user
- Navigate to IAM → Users -> dev -> security credentials -> access keys
- Click Create access key 
  - AWS will ask for the use case (CLI, SDK, etc.) → choose Command Line Interface (CLI) 
  - it may recommend you use CloudShell or Identity Center - we are not going to use these so just confirm you understand the recommendation
  - press Next 
  - description = "dev-private-computer-aws-access"
  - press "Create Access Key"
  - Once created, AWS will show you: Access Key ID, Secret Access Key 
  - copy these into a temporary document somewhere (to be used below)

# choose a region

- you should see a region dropdown on the top right of the screen - "Global" will be selected as IAM is a global service
- click on the dropdown and make a note of the code for the region most appropriate to you 
  - for example "us-east-1"
- this code will be referred to as your chosen/preferred/selected/default region throughout the remainder of the course !

# setup local machine for default connection to aws---

##  Run AWS CLI configuration

Run this command:

```bash
aws configure
```

It will ask you step by step:

```
AWS Access Key ID [None]: <as above>
AWS Secret Access Key [None]: <as above>
Default region name [None]: <as above>
Default output format [None]: json 
```

This creates a **default profile** in your local config files under `~/.aws/`

Lets take a look at what was created

## Verify

Check that your default profile is saved:

```bash
cat ~/.aws/credentials
```

You should see something like:

```ini
[default]
aws_access_key_id = AKIAIOSFODNN7EXAMPLE
aws_secret_access_key = wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
```

And in `~/.aws/config`:

```ini
[default]
region = us-east-1
output = json
```

---

## 2.3 Test

Run a simple command, e.g.:

```bash
aws sts get-caller-identity
```

It should return the IAM user’s ARN and account, confirming the CLI is using those credentials by default.

# Delete Access Keys when not required

These keys are very powerful - they give complete administrator access to your AWS account 

This would allow an unwanted intruder to run up bills you are repsonsible for.

It is therefore important to delete access keys when you do not require them.

To delete them 

- visit the same "Access Keys" panel as above
- select "Actions->delete" and follow the prompts 