# Python 3 anaconda with running jupyter notebook

## Extensions

1. [Tensorflow](https://www.tensorflow.org/install)

    ```bash
    $ docker exec -it vikds_anaconda3 /bin/bash
    $ python -c "import tensorflow as tf; print(tf.__version__)"
    2.3.0
    ```

2. [fastText](https://www.tensorflow.org/install)

    ```bash
    $ python
    >>> import fasttext
    >>>
    ```

## How to install

1. Install [Docker](https://docs.docker.com/engine/install/)

2. Let's assume local working directory as

    ```bash
    $ .../src/github/vikds
    ```

3. Clone repository source code or get the latest built image:

  * Clone repository source code from [GitHub](https://github.com/vikds/anaconda3)

    ```bash
    $ git clone https://github.com/vikds/anaconda3.git
    ```

  * Get the latest built image from [Docker Hub](https://hub.docker.com/r/vikds/anaconda3)

    ```bash
    $ docker pull vikds/anaconda3
    ```

4. Open working directory

    ```bash
    $ cd anaconda3
    ```

## How to use

### Build image from source code

Let's assume image name as

    vikds/anaconda3

Build docker image

    $ docker build -t vikds/anaconda3 .

List of all images

    $ docker images

Remove image

    $ docker rmi -f <name-or-image-id>
    $ docker rmi -f vikds/anaconda3

### Run image container

Let's assume container name as

    vikds_anaconda3

Run container

    $ docker run --name vikds_anaconda3 \
                 --publish 8888:8888 \
                 --volume $(pwd)/notebooks:/opt/notebooks \
                 --detach \
                 vikds/anaconda3

And open [localhost:8888](http://localhost:8888/) with password: **root**.

List of running containers

    $ docker ps -a

### Work with container

Print container output

    $ docker logs <name-or-container-id>
    $ docker logs vikds_anaconda3

Get a bash shell in the container

    $ docker exec -it <name-or-container-id> /bin/bash
    $ docker exec -it vikds_anaconda3 /bin/bash

### Stop and remove container

Stop container

    $ docker stop <name-or-container-id>
    $ docker stop vikds_anaconda3

Stop and remove container

    $ docker rm -f <name-or-container-id>
    $ docker rm -f vikds_anaconda3
