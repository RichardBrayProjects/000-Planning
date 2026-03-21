# Changes from 08 CSS text to 09 Block elements

## `index.css` — edit 1

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
.sans {
  font-size: 18px;
```

With this:

```
.block {
  padding: 12px;
  margin-top: 8px;
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
.roboto {
  font-family: "Roboto", sans-serif;
  font-size: 22px;
```

With this:

```
.red {
  background: red;
```

## `index.css` — edit 3

Find this nearby code above the change:

```
  font-size: 22px;
}
```

Insert this:

```

.blue {
  background: blue;
  color: white;
}

.yellow {
  background: yellow;
}
```


## `index.html` — edit 1

Find this nearby code below the change:

```
<link rel="stylesheet" href="index.css" />
```

Remove this:

```
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
  href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap"
  rel="stylesheet"
/>
```

## `index.html` — edit 2

Find this nearby code above the change:

```
<link rel="stylesheet" href="index.css" />
```

Replace this:

```
<h1>Default sans-serif</h1>
<p class="sans">This uses Arial, sans-serif.</p>

<h2>Google font</h2>
<p class="roboto">This uses Roboto from a CDN link.</p>
```

With this:

```
<h1>Block example</h1>
<div class="block red">div block</div>
<p class="block blue">p block</p>
<h2 class="block yellow">h2 block</h2>
```
