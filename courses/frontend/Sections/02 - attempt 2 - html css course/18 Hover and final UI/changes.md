# Changes from 17 Flexbox with scrolling to 18 Hover and final UI

## `index.css` — edit 1

Find this nearby code above the change:

```
  flex-direction: column;
  overflow: hidden;
```

Find this nearby code below the change:

```
  font-family: Arial, sans-serif;
}
```

Insert this:

```
  background: #1e1e2f;
  color: #f5f5f5;
```

## `index.css` — edit 2

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
  padding: 24px 16px;
```

With this:

```
  justify-content: center;
}

header {
  background: #1e293b;
  border-bottom: 1px solid #334155;
  padding: 12px 16px;
}
footer {
  background: #1e293b;
  border-top: 1px solid #334155;
  padding: 8px 16px;
  font-size: 14px;
  color: #94a3b8;
}
nav {
  display: flex;
  gap: 8px;
```

## `index.css` — edit 3

Find this nearby code above the change:

```
p {
  margin-top: 16px;
```

Find this nearby code below the change:

```
}
```

Remove this:

```
  max-width: 420px;
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
header,
footer {
  padding: 12px 16px;
```

With this:

```
.nav-button {
  color: #f5f5f5;
  font-size: 14px;
  border: 0px;
  border-radius: 6px;
  padding: 6px 16px;
  background-color: transparent;
```

## `index.css` — edit 5

Find this nearby code above the change:

```
  padding: 12px 16px;
}
```

Insert this:

```

.nav-button:hover {
  background-color: #334155;
}

.center-button {
  margin-top: 16px;
  background: #ffd166;
  color: #1e1e2f;
  padding: 10px 16px;
  font-size: 16px;
  border-radius: 6px;
  border: 0px;
  cursor: pointer;
}
```


## `index.html` — edit 1

Find this nearby code above the change:

```
  </head>
  <body>
```

Find this nearby code below the change:

```
    <main>
      <h1>Good Morning</h1>
```

Replace this:

```
    <header>Header</header>
```

With this:

```
    <header>
      <nav>
        <button class="nav-button">Home</button>
        <button class="nav-button">Profile</button>
        <button class="nav-button">Login</button>
      </nav>
    </header>
```

## `index.html` — edit 2

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
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum, tempore.</p>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Enim, numquam.</p>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempora, molestias.</p>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Fuga, eligendi.</p>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. At, iste.</p>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid, veniam.</p>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus, exercitationem.</p>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Assumenda, pariatur.</p>
```

With this:

```
      <p>
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum, tempore.
      </p>
      <button class="center-button">Click Me !</button>
```

## `index.html` — edit 3

Find this nearby code above the change:

```
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Assumenda, pariatur.</p>
    </main>
```

Find this nearby code below the change:

```
  </body>
</html>
```

Replace this:

```
    <footer>Footer</footer>
```

With this:

```
    <footer>status: logged out</footer>
```
