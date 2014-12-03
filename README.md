#hybris-tealiumIQ<br>vagrant demo server#
----------
This repo serves to allow you to be able to

 - easily startup a linux server
 - get hybris installed on that server
 - get the most current tealiumIQ addon for hybris from [here](https://github.com/patrickmcwilliams/HybrisIntegration)
 - add the addon to the environment
 - start the server

All of this happens automatically upon starting the vagrant instance


----------

###Install Vagrant###

Download the vagrant package for your OS [here](https://www.vagrantup.com/downloads.html)<br>
Install vagrant


----------
### Start Vagrant for hybris and TealimIQ ###
Open the terminal<br><br>
<img src="http://upload.wikimedia.org/wikipedia/commons/a/af/I3_window_manager_screenshot.png" alt="OSX terminal" height="200px"><br><br>

to start server<br>
change directory to where you cloned this repo (i.e "cd ~/Documents/git/hybris")<br>
type "vagrant up"<br>

to turn off<br>
change directory to where you cloned this repo (i.e "cd ~/Documents/git/hybris")<br>
type "vagrant halt"<br>

----------
That's it!
<br><br><br><br>
* NOTES

If this is the first time starting the vagrant image, it will take a couple hours to download the server image and build the environment. 
If you interrupt the process on accident, just do "vagrant halt; vagrant up" but only do so if it has hung for more than a few hours without any output to the console.

After the first time the server starts, it will take approximately 10 minutes to start after "vagrant up"

If there is any updates to the main repo for the addon, the server will grab the newest version after "vagrant up"



