# Changes from 10 Inline and inline-block to 11 Units

## `index.css` — edit 1

Find this nearby code above the change:

```
}
```

Find this nearby code below the change:

```
  padding: 12px;
  margin-bottom: 8px;
```

Replace this:

```
.block-box {
  display: block;
  background: red;
```

With this:

```
div {
  margin-top: 12px;
```

## `index.css` — edit 2

Find this nearby code above the change:

```
  background: red;
  padding: 12px;
```

Find this nearby code below the change:

```
}
```

Replace this:

```
  margin-bottom: 8px;
```

With this:

```
  background: lightgray;
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
.inline-box {
  display: inline;
  background: blue;
  color: white;
  padding: 12px;
```

With this:

```
.px-box {
  width: 200px;
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
.inline-block-box {
  display: inline-block;
  width: 140px;
  height: 60px;
  background: yellow;
  padding: 12px;
  margin-left: 8px;
```

With this:

```
.em-box {
  width: 10em;
```

## `index.css` — edit 5

Find this nearby code above the change:

```
  margin-left: 8px;
}
```

Insert this:

```

.vhvw-box {
  width: 50vw;
  height: 20vh;
}
```


## `index.html` — edit 1

Find this nearby code above the change:

```
<link rel="stylesheet" href="index.css" />
```

Replace this:

```
<div class="block-box">block</div>
<span class="inline-box">inline</span>
<span class="inline-block-box">inline-block</span>
```

With this:

```
<div class="px-box">200px wide</div>
<div class="em-box">10em wide</div>
<div class="vhvw-box">50vw wide and 20vh tall</div>
```
