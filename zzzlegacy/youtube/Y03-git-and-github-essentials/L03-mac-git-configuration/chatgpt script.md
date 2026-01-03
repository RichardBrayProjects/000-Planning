Hello and welcome back. If you’re intending to follow along with these lessons, then hopefully by now you’ve got all the required software installed. If you’ve only just installed it, there are a couple of Git configuration options that are absolutely essential when working with GitHub.

Before we look at those settings, it’s worth taking a moment to understand how these different pieces of software interact. I’ve drawn this highly simplified graphic to roughly demonstrate what’s going on.

On your machine, you’ll have Visual Studio Code and, no doubt, the Mac terminal. Both of them can talk to the Git command line utility. You can either type Git commands directly into the terminal, or you can give Visual Studio Code instructions, and it will run Git commands behind the scenes for you.

At this stage, all you really need to know is this: your files — and every version of those files — are stored locally inside a Git repository (or repo for short). Each time you make a change and create a commit, your local repo is updated.

GitHub provides a second copy of your repo in the cloud, and your job as a developer is to keep the two synchronized. To do that, Git gives us a few important commands.

The clone command creates a copy of a remote GitHub repo on your local machine.

The push command uploads your locally committed changes back to GitHub so the two repos stay in sync.

Now, back to the Git configuration settings. These settings help Git work smoothly with GitHub. Let’s take a look at the show notes.

Here is the repository for this course — we’re currently viewing lesson three. You’ll find a README file here that lists the commands I mentioned earlier: configuring your Git username and email address.

Whenever you push your changes to GitHub — especially to a public repo — GitHub requires these settings because it needs to record a name and email address for every commit.

Let’s open a terminal now. I’ll paste both commands in here:

git config --global user.name "Your Name"
git config --global user.email "you@example.com"

Nothing dramatic will happen immediately, but if we now run:

git config --list

We can see that Git has successfully stored those values.

One final thing to consider: if you’re committing to a publicly visible repo, anyone will be able to see the email address attached to your commits. If you’d prefer not to expose your personal email, you can use an anonymous or no-reply email like the one I used just now.

And that’s it! I hope everything is now clear. Thanks for watching, and I’ll see you in the next lesson.
