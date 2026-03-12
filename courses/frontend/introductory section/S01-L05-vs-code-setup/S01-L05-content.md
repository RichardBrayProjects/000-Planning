Below is a **natural teaching script** you could use while recording. I’ve written it in a **spoken, instructor-style narrative**, with **clear cues for slide changes and VS Code actions** so it flows smoothly in a video.

---

# Lesson Narrative – Recommended VS Code Setup

### Intro

In this lesson, I want to quickly go through the **VS Code setup** I’ll be using throughout the course.

You don’t have to match my setup exactly, but if you’d like to **follow along closely with what I’m doing**, I recommend installing a few extensions and enabling a couple of editor settings.

These will help ensure that **your editor behaves the same way mine does** while we work through the exercises.

---

## Slide 1 – Extensions

**[Switch to Slide: “Recommended Extensions”]**

The first thing I recommend installing is a small set of **VS Code extensions**.

These give us helpful shortcuts and formatting tools that will make writing code faster and cleaner.

The extensions I’ll be using are:

* **ES7+ React/Redux/React-Native snippets** – this gives us useful shortcuts when creating React components.
* **Live Preview** – which allows us to preview web pages directly inside VS Code.
* **Prettier** – a popular code formatter that automatically keeps our code style consistent.
* **TabOut** – which lets us quickly tab out of brackets, quotes, and other syntax.

If you’d like to follow along exactly with my environment, I recommend installing these now.

Let me quickly jump into **VS Code** and show you how to install them.

---

## VS Code – Installing Extensions

**[Switch to VS Code]**

First, open the **Extensions panel** in VS Code.

You can do that by clicking the **Extensions icon** on the left sidebar, or by pressing **Ctrl + Shift + X**.

Now we’ll install the extensions one by one.

**[Search for: ES7+ React/Redux/React-Native snippets]**

Search for **ES7+ React/Redux/React-Native snippets**, and install it.

This extension adds useful shortcuts when creating React components and other common React patterns.

**[Search for: Live Preview]**

Next, search for **Live Preview**, and install that as well.

This will allow us to preview our applications directly inside VS Code later in the course.

**[Search for: Prettier]**

Next is **Prettier**, which is the code formatter we’ll be using.

Install the **Prettier – Code formatter** extension.

This will automatically format our code so everything stays neat and consistent.

**[Search for: TabOut]**

Finally, install **TabOut**.

This extension makes editing faster by letting you **tab out of brackets, quotes, and other syntax** without manually moving the cursor.

Once these extensions are installed, we’re ready to configure a few editor settings.

---

## Slide 2 – Settings

**[Switch to Slide: “Recommended Settings”]**

Next, I recommend enabling a few editor settings.

These make formatting automatic and control how certain features behave while we’re coding.

The settings we’ll use are:

```
editor.formatOnSave: true
editor.defaultFormatter: esbenp.prettier-vscode
editor.linkedEditing: true
workbench.browser.openLocalhostLinks: true
```

I’ll now show you how to add these settings in **VS Code**.

---

## VS Code – Editing Settings

**[Switch back to VS Code]**

Open the **Settings JSON file**.

The easiest way to do that is:

1. Open the Command Palette with **Ctrl + Shift + P**
2. Type **“Preferences: Open Settings (JSON)”**
3. Select it.

This opens the configuration file where we can define our editor settings.

Now we’ll add the settings used in this course.

**[Type / paste settings]**

First, enable **format on save**:

```json
"editor.formatOnSave": true
```

This automatically formats our code every time we save a file.

Next, set **Prettier as the default formatter**:

```json
"editor.defaultFormatter": "esbenp.prettier-vscode"
```

This ensures that Prettier is the formatter used when formatting code.

Next, enable **linked editing**:

```json
"editor.linkedEditing": true
```

This is helpful when working with HTML and JSX because editing a tag automatically updates the matching closing tag.

Finally, we’ll configure how **localhost links open**:

```json
"workbench.browser.openLocalhostLinks": true
```

This setting controls whether links like `localhost:3000` open in an **external browser**, such as Chrome, or in the **integrated browser inside VS Code**.

At the start of the course we’ll mostly be using **Chrome**, but later we’ll switch to the **VS Code integrated browser**, so having this setting enabled will make that easy.

---

## Closing

Once you’ve installed the extensions and added these settings, your editor should behave the same way mine does during the course.

That means when you follow along with the exercises, **everything should work exactly as shown in the videos**.

With that setup complete, we’re now ready to start building our first project.

---

If you'd like, I can also help you turn this into a **shorter Udemy-style script (about 60–90 seconds)** so the lesson stays tight and avoids unnecessary runtime.
