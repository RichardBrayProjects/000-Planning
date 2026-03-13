Hello and welcome back.

This lesson shows you how to get your Windows machine set up.

We're going to do this by following the instructions in the course repo for this section of the course : frontend01-introduction.

So lets open that now ...

[ open repo in browser]

If you scroll down a little way, here is the Windows setup.

You can see here a list of the software required. So if you've already got Chrome, Node, Git, and Visual Studio Code installed on your machine, then there's no need to do anymore. You're all set up.

But if you haven't, then you've got a couple of options.

The first is you can go to websites for these applications and follow their installation instructions and download the software.

But there is an alternative. You can install it with winget which has come preinstalled with windows since about 2018 and this is how I've been installing most applications recently.

The commands to install these packages with winget are listed just here.

I have access to my windows machine in this window here.

[ open rdp connection to windows]

To run the commands I will just open a powershell terminal like this.

[ open powershell terminal ]

This machine already has the software installed but the commands will upgrade the software if there are newer versions available.

Let me show you.

[ cut and paste the commands and run them ]

So now is a good time for you to run these commands on your own machine for any packages you are missing.

And once everything is completed come back here As there are a couple of git commands needed to finish off the installation.

We just need to configure git config, with a name and and email address like this ..

[ run git config commands ]

This just ensures that whenever you do a commit or check something into, a repo, it's stamped with your name and your email address so other people can see who who did the commit.

Okay. Well, with that, we have actually completed the setup, and I will see you in the next lesson.
