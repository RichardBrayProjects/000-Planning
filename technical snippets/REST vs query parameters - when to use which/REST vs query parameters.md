Ah, excellent question! This is a **crucial** API design decision that confuses many developers. Let me break down the REST best practices for when to use **path parameters** vs **query parameters**.

## **Path Parameters vs Query Parameters: The Golden Rules**

### **Path Parameters (Part of the URL path)**

```
/api/users/123
/api/posts/456/comments/789
```

### **Query Parameters (After the `?`)**

```
/api/users?role=admin&status=active
/api/posts?page=2&limit=10&sort=date
```

---

## **When to Use Each: The Decision Framework**

### **Use PATH Parameters for:**

#### **1. Resource Identification (Required)**

Path parameters identify **which specific resource** you're working with:

```typescript
GET / api / users / 123; // Get user 123
GET / api / posts / 456; // Get post 456
PUT / api / users / 123; // Update user 123
DELETE / api / posts / 456 / comments / 789; // Delete comment 789 from post 456
```

**Rule:** If it identifies a **specific resource**, it's a path parameter.

#### **2. Hierarchical Relationships**

When resources have parent-child relationships:

```typescript
GET / api / users / 123 / orders; // All orders for user 123
GET / api / posts / 456 / comments; // All comments on post 456
GET / api / categories / tech / articles; // All articles in tech category
```

**Rule:** Path shows the **resource hierarchy**.

---

### **Use QUERY Parameters for:**

#### **1. Filtering Collections (Optional)**

Query parameters **filter** or **narrow down** a collection:

```typescript
// All users (returns everyone)
GET /api/users

// Filter users by optional criteria
GET /api/users?role=admin
GET /api/users?role=admin&status=active
GET /api/users?country=USA&age_min=18

// All posts
GET /api/posts

// Filter posts
GET /api/posts?author=john&status=published&category=tech
```

**Rule:** If it's **optional filtering**, use query parameters.

#### **2. Pagination**

```typescript
GET /api/users?page=2&limit=20
GET /api/posts?offset=40&limit=20
```

**Rule:** Pagination is always query parameters.

#### **3. Sorting**

```typescript
GET /api/users?sort=created_at&order=desc
GET /api/posts?sort=likes&order=asc
```

**Rule:** Sort order is always query parameters.

#### **4. Search**

```typescript
GET /api/products?search=laptop
GET /api/users?q=john
```

**Rule:** Search terms are query parameters.

#### **5. Field Selection (Sparse Fieldsets)**

```typescript
// Only return specific fields
GET /api/users/123?fields=name,email
GET /api/posts?fields=title,author,date
```

**Rule:** Field selection is query parameters.

---

## **Real-World Examples**

### **Good API Design:**

```typescript
// ✅ GOOD - Clear hierarchy and purpose
GET  /api/users/123                          // Specific user
GET  /api/users?role=admin&page=1            // Filter + paginate
GET  /api/users/123/orders                   // User's orders
GET  /api/users/123/orders?status=pending    // Filter user's orders
POST /api/users                               // Create user
PUT  /api/users/123                          // Update user
DELETE /api/users/123                        // Delete user
```

### **Bad API Design:**

```typescript
// ❌ BAD - Don't use query params for resource IDs
GET /api/users?id=123                        // Should be /api/users/123

// ❌ BAD - Don't use path params for filtering
GET /api/users/role/admin/status/active      // Should be /api/users?role=admin&status=active

// ❌ BAD - Mixing concerns
GET /api/users/123?action=delete             // Should be DELETE /api/users/123
POST /api/users/create                        // Should be POST /api/users
```

---

## **TypeScript Lambda Implementation**

Here's how to handle both properly in your course:

### **Path Parameters:**

```typescript
import { APIGatewayProxyHandler } from 'aws-lambda';

export const getUser: APIGatewayProxyHandler = async (event) => {
  // Extract path parameter
  const userId = event.pathParameters?.id;

  if (!userId) {
    return {
      statusCode: 400,
      body: JSON.stringify({ error: 'User ID is required' }),
    };
  }

  // Fetch user from database
  const user = await db.getUser(userId);

  if (!user) {
    return {
      statusCode: 404,
      body: JSON.stringify({ error: 'User not found' }),
    };
  }

  return {
    statusCode: 200,
    body: JSON.stringify(user),
  };
};
```

**API Gateway Configuration:**

```yaml
events:
  - http:
      path: users/{id} # Path parameter
      method: get
```

### **Query Parameters:**

```typescript
import { APIGatewayProxyHandler } from 'aws-lambda';

export const listUsers: APIGatewayProxyHandler = async (event) => {
  // Extract query parameters (all optional)
  const queryParams = event.queryStringParameters || {};

  const {
    role,
    status,
    page = '1',
    limit = '10',
    sort = 'created_at',
    order = 'desc',
  } = queryParams;

  // Build filters
  const filters: any = {};
  if (role) filters.role = role;
  if (status) filters.status = status;

  // Pagination
  const pageNum = parseInt(page);
  const limitNum = parseInt(limit);
  const offset = (pageNum - 1) * limitNum;

  // Fetch filtered users
  const users = await db.getUsers({
    filters,
    limit: limitNum,
    offset,
    sort,
    order,
  });

  return {
    statusCode: 200,
    body: JSON.stringify({
      data: users,
      pagination: {
        page: pageNum,
        limit: limitNum,
        total: await db.countUsers(filters),
      },
    }),
  };
};
```

**API Gateway Configuration:**

```yaml
events:
  - http:
      path: users # No path parameters
      method: get
```

---

## **Combining Both (Common Pattern):**

```typescript
// Get orders for a specific user, with filters
export const getUserOrders: APIGatewayProxyHandler = async (event) => {
  // PATH parameter: which user
  const userId = event.pathParameters?.userId;

  // QUERY parameters: how to filter/sort those orders
  const {
    status,
    startDate,
    endDate,
    sort = 'date',
    order = 'desc',
  } = event.queryStringParameters || {};

  const orders = await db.getOrders({
    userId, // From path - required
    status, // From query - optional filter
    startDate,
    endDate,
    sort,
    order,
  });

  return {
    statusCode: 200,
    body: JSON.stringify(orders),
  };
};
```

**API Gateway Configuration:**

```yaml
events:
  - http:
      path: users/{userId}/orders
      method: get
```

**Usage:**

```
GET /api/users/123/orders?status=completed&sort=total&order=desc
```

---

## **Decision Tree for Your Students**

```
Is it identifying a SPECIFIC resource?
├─ YES → Path parameter
│   └─ /api/users/123
│
└─ NO → Is it filtering/modifying a COLLECTION?
    ├─ YES → Query parameter
    │   └─ /api/users?role=admin
    │
    └─ Is it a parent-child relationship?
        ├─ YES → Path parameters for both
        │   └─ /api/users/123/orders/456
        │
        └─ Pagination/Sorting/Search?
            └─ Query parameters
                └─ /api/posts?page=2&sort=date
```

---

## **Best Practices Summary for Your Course**

### **✅ DO:**

1. **Path parameters = Resource identity** (required, hierarchical)
2. **Query parameters = Optional modifiers** (filter, sort, paginate)
3. Keep query parameters optional (provide defaults)
4. Validate both path and query parameters
5. Use clear, consistent naming conventions

### **❌ DON'T:**

1. Use query parameters for resource IDs
2. Use path parameters for filtering or searching
3. Make query parameters required (defeats their purpose)
4. Mix verbs into paths (`/api/users/delete/123`)
5. Use query parameters for actions (use HTTP methods instead)

---

## **Teaching Progression**

**Week 1-2:** Simple path parameters

```typescript
GET / api / users / 123;
DELETE / api / posts / 456;
```

**Week 3-4:** Add query parameters

```typescript
GET /api/users?role=admin
GET /api/posts?author=john&status=published
```

**Week 5:** Combine both

```typescript
GET /api/users/123/orders?status=pending&limit=10
```

**Week 6:** Advanced patterns

```typescript
GET /api/search?q=laptop&category=electronics&price_min=100&price_max=500
```

---

This distinction is **fundamental to REST API design** and will serve your students well throughout their careers. Path parameters say **"which one"** while query parameters say **"how to filter/modify"**. Make this crystal clear in your course!
