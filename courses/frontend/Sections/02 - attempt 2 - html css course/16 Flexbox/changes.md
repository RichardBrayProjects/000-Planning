# Changes from 15 Scrolling to 16 Flexbox

## `index.css` — edit 1

Find this nearby code below the change:

```
}
```

Replace this:

```
body {
  font-family: Arial, sans-serif;
  padding: 20px;
```

With this:

```
* {
  margin: 0px;
```

## `index.css` — edit 2

Find this nearby code above the change:

```
}
```

Find this nearby code below the change:

```
}
```

Replace this:

```
.scroll-box {
  height: 160px;
  overflow: auto;
  border: 2px solid black;
  padding: 12px;
```

With this:

```
body {
  height: 100vh;
  display: flex;
  flex-direction: column;
  font-family: Arial, sans-serif;
```

## `index.css` — edit 3

Find this nearby code above the change:

```
}
```

Find this nearby code below the change:

```
p {
  margin: 0 0 12px;
```

Insert this:

```
main {
  flex: 1;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

h1,
h2,
```

## `index.css` — edit 4

Find this nearby code above the change:

```

p {
```

Find this nearby code below the change:

```
}
```

Replace this:

```
  margin: 0 0 12px;
```

With this:

```
  margin-top: 16px;
```

## `index.css` — edit 5

Find this nearby code above the change:

```
  margin: 0 0 12px;
}
```

Insert this:

```

header,
footer {
  padding: 12px 16px;
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

With this:

```
    <header>Header</header>
    <main>
      <h1>Good Morning</h1>
      <h2>Time for Coffee</h2>
      <p>Lorem ipsum dolor sit amet.</p>
    </main>
    <footer>Footer</footer>
```
