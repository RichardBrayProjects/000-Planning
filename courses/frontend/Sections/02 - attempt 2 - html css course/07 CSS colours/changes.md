# Changes from 06 CSS selectors to 07 CSS colours

## `index.css` — edit 1

Find this nearby code above the change:

```
h1 {
```

Find this nearby code below the change:

```
}
```

Replace this:

```
  color: navy;
```

With this:

```
  color: blue;
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
#page-title {
  background: aliceblue;
```

With this:

```
.named {
  background: gold;
  color: darkgreen;
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
.subheading {
  color: darkred;
```

With this:

```
h2 {
  color: rgb(120, 20, 20);
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
div p {
  border: 1px solid gray;
```

With this:

```
.rgb {
  background: rgb(230, 230, 250);
  color: rgb(20, 20, 120);
```


## `index.html` — edit 1

Find this nearby code above the change:

```
<link rel="stylesheet" href="index.css" />
```

Replace this:

```
<h1 id="page-title">Good Morning</h1>
<h2 class="subheading">Time for Coffee</h2>
<p class="subheading">Welcome to HTML.</p>
<div>
  <p>Inside a div.</p>
</div>
```

With this:

```
<h1>Named colour</h1>
<p class="named">This uses named colours.</p>

<h2>RGB colour</h2>
<p class="rgb">This uses rgb colours.</p>
```
