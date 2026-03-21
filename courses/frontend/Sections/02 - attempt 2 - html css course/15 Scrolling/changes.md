# Changes from 14 HTML document structure to 15 Scrolling

## `index.css` — edit 1

Find this nearby code above the change:

```
body {
  font-family: Arial, sans-serif;
```

Find this nearby code below the change:

```
}
```

Insert this:

```
  padding: 20px;
```

## `index.css` — edit 2

Find this nearby code above the change:

```
  font-family: Arial, sans-serif;
}
```

Insert this:

```

.scroll-box {
  height: 160px;
  overflow: auto;
  border: 2px solid black;
  padding: 12px;
}

p {
  margin: 0 0 12px;
}
```


## `index.html` — edit 1

Find this nearby code above the change:

```
  </head>
  <body>
```

Find this nearby code below the change:

```
  </body>
</html>
```

Replace this:

```
    <header>Header</header>
    <main>
      <h1>Good Morning</h1>
      <h2>Time for Coffee</h2>
      <p>Welcome to the structured page.</p>
    </main>
    <footer>Footer</footer>
```

With this:

```
    <h1>Scrolling demo</h1>
    <div class="scroll-box">
      <p>Item 1 — lorem ipsum dolor sit amet.</p>
      <p>Item 2 — lorem ipsum dolor sit amet.</p>
      <p>Item 3 — lorem ipsum dolor sit amet.</p>
      <p>Item 4 — lorem ipsum dolor sit amet.</p>
      <p>Item 5 — lorem ipsum dolor sit amet.</p>
      <p>Item 6 — lorem ipsum dolor sit amet.</p>
      <p>Item 7 — lorem ipsum dolor sit amet.</p>
      <p>Item 8 — lorem ipsum dolor sit amet.</p>
    </div>
```
