# Changes from 03 CSS inline to 04 CSS style section

## `index.html` — edit 1

Replace this:

```
<h1 style="color: navy;">Good Morning</h1>
<h2 style="font-size: 20px;">Time for Coffee</h2>
<p style="background: lightyellow;">Welcome to HTML.</p>
```

With this:

```
<style>
  h1 {
    color: navy;
  }

  h2 {
    font-size: 20px;
  }

  p {
    background: lightyellow;
  }
</style>

<h1>Good Morning</h1>
<h2>Time for Coffee</h2>
<p>Welcome to HTML.</p>
```
