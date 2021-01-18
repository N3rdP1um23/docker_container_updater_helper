# docker_container_updater_helper
The following repository is used to help update either all or specified docker containers quickly and easily.

## What does it do?
The script, once setup, will help any user quickly and easily update all or specific Docker containers on their server without having to manually change directories making container updates quicker and easier.

## Setup
1. `cd` to the same directory as your compose and env files and execute the following command to download the latest updater script `curl -o Docker_Updater.tar.gz -L -O $( curl -s https://api.github.com/repos/N3rdP1um23/docker_container_updater_helper/releases | grep tarball_url | head -1 | cut -d \" -f 4 )`
  - Please make sure you have `curl` installed before running the above listed command
2. After the download is complete, run the following command to unzip the actual updater script `tar -xvzf Docker_Updater.tar.gz $( tar -tf Docker_Updater.tar.gz | grep docker_updater.sh ) --strip-components 1`
  - If you'd like, you can remove the tarball file `rm Docker_Updater.tar.gz`
3. Once the file is successfully uncompressed, you can setup your update command alias
  1. Grab the current directory path `pwd` and copy the result
  2. execute the following command `alias dockerupdate="<PWD_OUPUT>/docker_updater.sh"`, where `<PWD_OUPUT>` is the value from running the previous step
    - You can also customize the command alias name from `dockerupdate` to something of your chosing if you'd like
4. After that, you're all set!


## Usage Example
If no parameters are provided, all containers will be updated. Do to so, run the following command
`> dockerupdate` 

If you'd like to update a list of specific containers, feel free to provide a list of container names as follows
`> dockerupdate container_name1 container_name2 container_name3` 
