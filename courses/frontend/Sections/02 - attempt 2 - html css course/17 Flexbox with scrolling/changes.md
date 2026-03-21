# Changes from 16 Flexbox to 17 Flexbox with scrolling

## `index.css` — edit 1

Find this nearby code above the change:

```
  display: flex;
  flex-direction: column;
```

Find this nearby code below the change:

```
  font-family: Arial, sans-serif;
}
```

Insert this:

```
  overflow: hidden;
```

## `index.css` — edit 2

Find this nearby code above the change:

```
main {
  flex: 1;
```

Find this nearby code below the change:

```
  display: flex;
  flex-direction: column;
```

Insert this:

```
  overflow: auto;
```

## `index.css` — edit 3

Find this nearby code above the change:

```
  flex-direction: column;
  align-items: center;
```

Find this nearby code below the change:

```
}
```

Replace this:

```
  justify-content: center;
```

With this:

```
  padding: 24px 16px;
```

## `index.css` — edit 4

Find this nearby code above the change:

```
p {
  margin-top: 16px;
```

Find this nearby code below the change:

```
}
```

Insert this:

```
  max-width: 420px;
```


## `index.html` — edit 1

Find this nearby code above the change:

```
      <h1>Good Morning</h1>
      <h2>Time for Coffee</h2>
```

Find this nearby code below the change:

```
    </main>
    <footer>Footer</footer>
```

Replace this:

```
      <p>Lorem ipsum dolor sit amet.</p>
```

With this:

```
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum, tempore.</p>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Enim, numquam.</p>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempora, molestias.</p>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Fuga, eligendi.</p>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. At, iste.</p>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid, veniam.</p>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus, exercitationem.</p>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Assumenda, pariatur.</p>
```
