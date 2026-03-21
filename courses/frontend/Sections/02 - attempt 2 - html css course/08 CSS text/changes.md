# Changes from 07 CSS colours to 08 CSS text

## `index.css` — edit 1

Find this nearby code below the change:

```
}
```

Replace this:

```
h1 {
  color: blue;
```

With this:

```
body {
  font-family: Arial, sans-serif;
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
.named {
  background: gold;
  color: darkgreen;
```

With this:

```
.sans {
  font-size: 18px;
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
h2 {
  color: rgb(120, 20, 20);
```

With this:

```
.roboto {
  font-family: "Roboto", sans-serif;
  font-size: 22px;
```

## `index.css` — edit 4

Find this nearby code above the change:

```
  color: rgb(120, 20, 20);
}
```

Remove this:

```

.rgb {
  background: rgb(230, 230, 250);
  color: rgb(20, 20, 120);
}
```


## `index.html` — edit 1

Find this nearby code below the change:

```
<link rel="stylesheet" href="index.css" />
```

Insert this:

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

Find this nearby code below the change:

```

<h2>RGB colour</h2>
```

Replace this:

```
<h1>Named colour</h1>
<p class="named">This uses named colours.</p>
```

With this:

```
<h1>Default sans-serif</h1>
<p class="sans">This uses Arial, sans-serif.</p>
```

## `index.html` — edit 3

Find this nearby code above the change:

```
<p class="named">This uses named colours.</p>
```

Replace this:

```
<h2>RGB colour</h2>
<p class="rgb">This uses rgb colours.</p>
```

With this:

```
<h2>Google font</h2>
<p class="roboto">This uses Roboto from a CDN link.</p>
```
