docker-data
===========

A minimal (empty) docker container that can still be run.
The idea is to use this as a base image for data-volumes.

Create a data-container
--------------
`docker run --name data grynn/data`

You need to run the image (and thereby create a 'container'). This only needs be done once. 
The (data-)container need not be running for other containers to be able to use exported volumes.

Backup the data-image
--------------
`docker run --volumes-from data --rm -v $(pwd):/backup busybox tar cvf /backup/data.tar /data`

Restore the data-image
--------------
`docker run --volumes-from data --rm -v $(pwd):/backup busybox tar xvvf /backup/data.tar -C /`
