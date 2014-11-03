## Getting started with grynn/data

grynn/data is a minimal (empty) docker data-volume container. It exposes a single folder: '/data'

In order to be able to use exported volumes, you need to run grynn/data at-least once (after each reboot). Note that the container need not be running for other containers to be able to access data from it. 

For example, if you want to create a persistent store for elasticsearch:

`docker run --name esdata grynn/data`

This creates a _blank_ data-container named esdata that can be used for storing elastic-search data, configs and other persistent stuff.

Run elasticsearch
`docker create --volumes-from esdata --name es dockerfile/elasticsearch`
`docker start es`
`docker stop es`

You cannot commit changes to the data container's image (at least not yet, 3/11/2014), which means you can just commit/push the data-container to a docker registry. Instead you need to periodically tar/rsync  the contents of the data-container to a local directory. 

### Backup the data-container
`docker run --volumes-from esdata --rm -v $(pwd):/backup busybox tar cvf /backup/data.tar /data`

### Restore the data-image
`docker run --volumes-from esdata --rm -v $(pwd):/backup busybox tar xvvf /backup/data.tar -C /`
