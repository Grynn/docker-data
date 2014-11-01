docker-data
===========

A minimal (empty) docker container that can still be run.
The idea is to use this as a base image for data-volumes.

Create a data-volume
====

docker run --name data grynn/data 

That's it. 

Backup the data-volume
====
docker run --volumes-from data --rm -v $(pwd):/backup busybox tar cvf /backup/data.tar /data

Restore the data-volume
====
docker run --volumes-from data --rm -v $(pwd):/backup busybox tar xvf /backup/data.tar /data
