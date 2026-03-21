# Changes from 12 Borders margins padding centering to 13 Positioning

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
  height: 120vh;
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
.card {
  width: 240px;
  margin: 40px auto;
  padding: 20px;
  border: 2px solid black;
  border-radius: 12px;
```

With this:

```
.stage {
  position: relative;
  width: 260px;
  height: 140px;
  margin: 40px;
  background: lightgray;
```

## `index.css` — edit 3

Find this nearby code above the change:

```
  border-radius: 12px;
}
```

Insert this:

```

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

Find this nearby code above the change:

```
<link rel="stylesheet" href="index.css" />
```

Find this nearby code below the change:

```
</div>
```

Replace this:

```
<div class="card">
  Centered box
```

With this:

```
<div class="stage">
  <div class="relative-box">relative</div>
  <div class="absolute-box">absolute</div>
```

## `index.html` — edit 2

Find this nearby code above the change:

```
  Centered box
</div>
```

Insert this:

```

<div class="fixed-box">fixed</div>
```
