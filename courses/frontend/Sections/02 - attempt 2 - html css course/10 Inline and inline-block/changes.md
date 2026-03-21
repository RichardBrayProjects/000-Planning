# Changes from 09 Block elements to 10 Inline and inline-block

## `index.css` — edit 1

Find this nearby code above the change:

```
}
```

Find this nearby code below the change:

```
  padding: 12px;
  margin-top: 8px;
```

Replace this:

```
.block {
```

With this:

```
.block-box {
  display: block;
  background: red;
```

## `index.css` — edit 2

Find this nearby code above the change:

```
.block {
  padding: 12px;
```

Find this nearby code below the change:

```
}
```

Replace this:

```
  margin-top: 8px;
```

With this:

```
  margin-bottom: 8px;
```

## `index.css` — edit 3

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
.red {
  background: red;
```

With this:

```
.inline-box {
  display: inline;
  background: blue;
  color: white;
  padding: 12px;
```

## `index.css` — edit 4

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
.blue {
  background: blue;
  color: white;
```

With this:

```
.inline-block-box {
  display: inline-block;
  width: 140px;
  height: 60px;
  background: yellow;
  padding: 12px;
  margin-left: 8px;
```

## `index.css` — edit 5

Find this nearby code above the change:

```
  color: white;
}
```

Remove this:

```

.yellow {
  background: yellow;
}
```


## `index.html` — edit 1

Find this nearby code above the change:

```
<link rel="stylesheet" href="index.css" />
```

Replace this:

```
<h1>Block example</h1>
<div class="block red">div block</div>
<p class="block blue">p block</p>
<h2 class="block yellow">h2 block</h2>
```

With this:

```
<div class="block-box">block</div>
<span class="inline-box">inline</span>
<span class="inline-block-box">inline-block</span>
```
