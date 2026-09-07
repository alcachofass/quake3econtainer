# quake3econtainer

A quake3e server running in a container.

*.pk3 files are NOT included here. These come from the Quake 3 Arena CD, Mods, Team Arena CD, and Point Release 1.32. Check the docker-compose.yml file to see how to mount  directories. 

## Building the Container

* docker compose build

## Running the Service

* docker compose up -d

## Volume Mount Explanation
The only required mounts are your baseq3 folder directory and custom launcher.sh script; mod folders are optional.
 - "${PWD}/${FS_GAME}:/home/q3user_svc/.q3a/${FS_GAME}/"
	* In this example, we also mount the mod directory if specified in .env file.
 - "${PWD}/baseq3:/home/q3user_svc/.q3a/baseq3/"
	* The required baseq3 folder mount.
 - "${PWD}/launcher.sh:/home/q3user_svc/.q3a/launcher.sh"
	* The container will execute launcher.sh, this is a required mount.
