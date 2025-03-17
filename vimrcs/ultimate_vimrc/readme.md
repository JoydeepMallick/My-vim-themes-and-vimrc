## Setup Instructions specific to Windows Installation (Not within WSL) :

1. The `.vimrc` to be used here is in the folder `./Windows/` above.

2.Open the `%HOME%` directory on your Windows pc. To locate the home directory, press <kbd>Ctrl</kbd> + <kbd>Windows</kbd> and then type `%HOME%`. Press <kbd>Enter</kbd> to open your home directory.

4. Check if a `.vimrc` file is present in the home directory. If not, create a new `.vimrc` file and copy the contents of my `.vimrc` into it.

5. Ensure that the vim-plug plugin manager is installed. If not, visit their [GitHub page](https://github.com/junegunn/vim-plug) and follow the installation guidelines.

6. Run PlugInstall. Open gvim or vim, then type `:PlugInstall` in the vim command line and press <kbd>Enter</kbd>.

7. The necessary packages will be installed and ready to use.

8. Customize the `.vimrc` file according to your preferences. Feel free to contact me if you encounter any issues or have suggestions for improvement.

#### If stuck , ```:help``` in vim comes to the rescue🥺 most of the times, read documentation, learnt it from experience.

### Update:

I have added a modified_startify.vim folder that is sourced within the `.vimrc` file itself. Copy it to your desired location and *edit the location accordingly* in the modified startup section of my `.vimrc`. 🙂

By default, I have set it to be present in the home directory, so there should be no need to modify the code.

If you have any further questions, please don't hesitate to reach out.


## Setup instruction for WSL2 within Windows (complete linux experience) :

1. Install `vim` in WSL2. Then launch it by typing  `vim`<kbd> Enter </kbd>.  
2. Type `:e $MYVIMRC` which directly opens up the file. Its located in the home directory where you will also find `.bashrc` or `.zshrc`. You can later confirm it by opening a new terminal in wsl2 and typing `find .vimrc` or `find _vimrc` and one will give output probably. Do some more google search.
3. In the vimrc copy paste all contents as my `.vimrc` specifically curated for WSL2 (tested in debian 12).
4. Save and quit using `:wq`.
5. Now reopen vim and then type `:PlugInstall` to be Vim Plug Plugin Manager (in this case) install all the necessary modules from internet like LSP, themes, ....
6. Now its ready.
