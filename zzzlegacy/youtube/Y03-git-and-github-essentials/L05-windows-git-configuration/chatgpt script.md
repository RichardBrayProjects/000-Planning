Hello and welcome back. If you’re intending to follow along with these lessons, then hopefully by now you’ve got all the required software installed.

Before you start working with Git there are a couple of configuration options that are absolutely essential when working with GitHub.

Before we look at those settings, it’s worth taking a moment to understand how these different pieces of software interact. I’ve drawn this highly simplified graphic to roughly demonstrate what’s going on.

On your machine, you’ll have Visual Studio Code and, no doubt, of course a the Terminal.

Both of them can talk to the Git command line utility. You can either type Git commands directly into the terminal, or you can give Visual Studio Code instructions, and it will run Git commands behind the scenes for you.

On the graphic I've shown a local Git Repo which contains a set of files.

The main point is that using Git you can make changes to those files and commit the changes and the repo will keep a snapshot of each commited version.

GitHub provides a second copy of your repo in the cloud, and the goal is to keep the two synchronized. And to do that, Git provides some useful commands which I've shown on the graphic.

The clone command gets hold of the remote GitHub repo and makes a copy of it on your local machine.

Once you've made some changes to this local repo you can then use the git push command to push those changes up to the remote GitHub repo.

So with that in light lets start looking at some Git configuration settings.

I have put together a list of these in the course repo… and there's a link to that repo in the show notes for every lesson.

So for instance, here's lesson one, and if you just scroll down a little bit, here's the link. Lets just follow it now ...

By the time I've finished recording this course you should find a folder for each lesson.

So here is the current lesson : lesson five, Windows git configuration and a README file which contains the configuration commands

So, the first couple of commands help Git work smoothly with GitHub : they configure your Git username and email address.

Whenever you push your changes to GitHub — especially to a public repo — GitHub requires these settings because it needs to record a name and email address for every commit.

Let’s open a terminal now. I’ll paste both commands in here:

git config --global user.name "oxford-dev-tutorials"
git config --global user.email "user@example.com"

Nothing dramatic will happen immediately, but if we now run:

git config --list

We can see that Git has successfully stored those values.

One thing to consider: if you’re committing to a publicly visible repo, anyone will be able to see the email address attached to your commits. If you’d prefer not to expose your personal email, you can use an anonymous or no-reply email like the one I used just now.

Another thing to be aware of when working on Windows is that some of the repos you might want to clone may have been produced on a Mac or Linux box.

Repos on these platforms may be using paths to files and you do need to make a couple of extra configuration changes to support those.

You can see the two configuration commands necessary to achieve this in the window so lets run those commands too.

Finally, there is a bit of an issue with line ending compatibility between windows and MacOS or Linux and to fix that you will need this final command.

So lets run that one too.

And now we can recheck our settings with

git config --list

And again, we can see that Git has successfully stored those values.

And that’s it! I hope everything is now clear. Thanks for watching, and I’ll see you in the next lesson.
