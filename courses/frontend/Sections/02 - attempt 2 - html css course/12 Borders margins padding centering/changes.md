# Changes from 11 Units to 12 Borders margins padding centering

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
div {
  margin-top: 12px;
  padding: 12px;
  background: lightgray;
```

With this:

```
.card {
  width: 240px;
  margin: 40px auto;
  padding: 20px;
  border: 2px solid black;
  border-radius: 12px;
```

## `index.css` — edit 2

Find this nearby code above the change:

```
  background: lightgray;
}
```

Remove this:

```

.px-box {
  width: 200px;
}

.em-box {
  width: 10em;
}

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
<div class="px-box">200px wide</div>
<div class="em-box">10em wide</div>
<div class="vhvw-box">50vw wide and 20vh tall</div>
```

With this:

```
<div class="card">
  Centered box
</div>
```
