#!/bin/bash

docker run --volumes-from data --rm -v $(pwd):/backup busybox tar cvf /backup/data.tar /data
