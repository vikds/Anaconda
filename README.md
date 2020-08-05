# Python 3 anaconda with running jupyter notebook

## Repositories

### Image repository

Docker Hub: [vikds/anaconda3](https://hub.docker.com/repository/docker/vikds/anaconda3)

### Code repository

GitHub: [vikds/anaconda3](https://github.com/vikds/anaconda3)

## How to install

* Install [docker](https://docs.docker.com/engine/install/)
* Clone repository:

```bash
$ git clone https://github.com/vikds/anaconda3.git
$ cd anaconda3
```

## How to use

### Build

Let's assume image name as

    vikds/anaconda3

Build docker image

    $ docker build -t vikds/anaconda3 .

List of all images

    $ docker images

Remove image

    $ docker rmi -f <name-or-image-id>
    $ docker rmi -f vikds/anaconda3

### Run

Let's assume container name as

    vikds_anaconda3

Run container

    $ docker run vikds/anaconda3 \
                 --name vikds_anaconda3 \
                 --publish 8888:8888 \
                 --volume $(pwd)/notebooks:/opt/notebooks \
                 --detach

And open [localhost:8888](http://localhost:8888/) with password: **root**.

List of running containers

    $ docker ps -a

Stop container

    $ docker stop <name-or-container-id>
    $ docker stop vikds_anaconda3

Stop and remove container

    $ docker rm -f <name-or-container-id>
    $ docker rm -f vikds_anaconda3

### Work with it

Print app output

    $ docker logs <name-or-container-id>
    $ docker logs vikds_anaconda3

Run bash inside it

    $ docker exec -it <name-or-container-id> /bin/bash
    $ docker exec -it vikds_anaconda3 /bin/bash
