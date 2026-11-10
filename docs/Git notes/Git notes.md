System settings:

System: All Users

Global: All repositories of the current users

Local: The current repository

First when starting up you configure git with:

1. git config --global user.name "(Full name)" (double quotes since it has a space in between)

2. git config --global user.email (email address)

3. (Optional) if you want to set a different editor from VIM use this:
	git config --global core.editor "code --wait"
	
	You can also open up a configuration file to view and edit all global settings:
	git config --global -e

3. Git config --help is also quite useful for showing all the commands for config or git config -h for a shorter refresher.

4. 
