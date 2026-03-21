# Changes from 05 CSS external file to 06 CSS selectors

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
h2 {
  font-size: 20px;
```

With this:

```
#page-title {
  background: aliceblue;
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
p {
  background: lightyellow;
```

With this:

```
.subheading {
  color: darkred;
```

## `index.css` — edit 3

Find this nearby code above the change:

```
  background: lightyellow;
}
```

Insert this:

```

div p {
  border: 1px solid gray;
}
```


## `index.html` — edit 1

Find this nearby code above the change:

```
<link rel="stylesheet" href="index.css" />
```

Replace this:

```
<h1>Good Morning</h1>
<h2>Time for Coffee</h2>
<p>Welcome to HTML.</p>
```

With this:

```
<h1 id="page-title">Good Morning</h1>
<h2 class="subheading">Time for Coffee</h2>
<p class="subheading">Welcome to HTML.</p>
<div>
  <p>Inside a div.</p>
</div>
```
