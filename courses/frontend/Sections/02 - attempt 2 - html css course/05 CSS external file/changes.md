# Changes from 04 CSS style section to 05 CSS external file

## Create `index.css`

Create this file with:

```
h1 {
  color: navy;
}

h2 {
  font-size: 20px;
}

p {
  background: lightyellow;
}
```

## `index.html` — edit 1

Find this nearby code below the change:

```

<h1>Good Morning</h1>
```

Replace this:

```
<style>
  h1 {
    color: navy;
  }

  h2 {
    font-size: 20px;
  }

  p {
    background: lightyellow;
  }
</style>
```

With this:

```
<link rel="stylesheet" href="index.css" />
```
