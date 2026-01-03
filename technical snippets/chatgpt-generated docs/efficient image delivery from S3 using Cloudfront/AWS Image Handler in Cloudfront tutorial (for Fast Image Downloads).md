Using AWS Image Handler for a Photo Sharing Website
This document summarizes how to integrate AWS Image Handler into a photo sharing website
architecture. It covers efficient storage, retrieval, and rendering of user-uploaded images using S3,
Postgres, CloudFront, and AWS Image Handler with a React + Vite + Tailwind frontend. It also
includes a proposed database schema (images, users, likes, comments) to support social features.
1. Architecture Overview
- S3: Stores only original full-size images. - Postgres: Stores image metadata (id, key, tags,
uploadedAt, title, etc.). - Express API: Provides endpoints for uploading, fetching metadata, and
constructing image URLs. - AWS Image Handler: On-the-fly image resizing and optimization.
Cached by CloudFront. - React Frontend: Displays thumbnails and full-size images via CloudFront
URLs.
2. Serving Images Without Image Handler
- API queries Postgres and returns S3 presigned URLs for originals. - Frontend loads full-size files
(e.g. 5MB images) into grid view. - This wastes bandwidth and increases load times for thumbnails.
3. Serving Images With Image Handler
- API still queries Postgres for metadata. - Instead of S3 presigned URLs, API constructs
CloudFront URLs with query parameters, e.g.:
https://cdn.example.com/uploads/beach.jpg?width=400&format;=webp - First request: Lambda
resizes and caches result at CloudFront. - Subsequent requests: Served instantly from the CDN
edge.
4. Example Express.js API Endpoint
```javascript
app.get("/images", async (req, res) => {
    const result = await pool.query("SELECT * FROM images ORDER BY uploaded_at DESC LIMIT 20");
    const images = result.rows.map(row => ({
        id: row.id,
        title: row.title,
        thumbnailUrl: `https://cdn.example.com/${row.key}?width=400&format;=webp`,
        fullUrl: `https://cdn.example.com/${row.key}`
    }));
    res.json(images);
});
```
5. Full Upload Flow
1. User selects file in frontend and requests an upload URL from API. 2. API generates S3
presigned PUT URL and inserts metadata into Postgres. 3. Frontend uploads directly to S3 using
the presigned URL. 4. API /images endpoint serves metadata + CloudFront URLs to frontend. 5.
React frontend displays thumbnails (400px) in grid and loads full-size when clicked.
6. Benefits of AWS Image Handler

- Massive bandwidth savings by delivering thumbnails instead of full originals. - Automatic format
optimization (WebP/AVIF when supported). - Cached at CloudFront edge, so resizing only happens
once per unique size/format. - Simplifies architecture: only originals are stored, variants are
generated on demand.