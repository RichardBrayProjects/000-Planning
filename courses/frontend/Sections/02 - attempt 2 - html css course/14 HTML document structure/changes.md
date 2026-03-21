# Changes from 13 Positioning to 14 HTML document structure

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

Remove this:

```
  height: 120vh;
```

## `index.css` — edit 2

Find this nearby code above the change:

```
  height: 120vh;
}
```

Remove this:

```

.stage {
  position: relative;
  width: 260px;
  height: 140px;
  margin: 40px;
  background: lightgray;
}

.relative-box {
  position: relative;
  top: 10px;
  left: 10px;
  background: gold;
}

.absolute-box {
  position: absolute;
  right: 10px;
  bottom: 10px;
  background: skyblue;
}

.fixed-box {
  position: fixed;
  top: 10px;
  right: 10px;
  background: tomato;
}
```


## `index.html` — edit 1

Replace this:

```
<link rel="stylesheet" href="index.css" />

<div class="stage">
  <div class="relative-box">relative</div>
  <div class="absolute-box">absolute</div>
</div>

<div class="fixed-box">fixed</div>
```

With this:

```
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="index.css" />
  </head>
  <body>
    <header>Header</header>
    <main>
      <h1>Good Morning</h1>
      <h2>Time for Coffee</h2>
      <p>Welcome to the structured page.</p>
    </main>
    <footer>Footer</footer>
  </body>
</html>
```
