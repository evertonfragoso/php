PHP 7.1 docker container with apache and PostgreSQL support

## Requirements

### [Docker](https://www.docker.com/products/overview)

[Download Mac](https://download.docker.com/mac/stable/Docker.dmg) -
[Download Windows](https://download.docker.com/win/stable/InstallDocker.msi)

## Setup

1. Install docker

2. Clone this repository 
  ```bash
  $ git clone https://github.com/evertonfragoso/php-container.git
  ```

3. Build the container
  ```bash
  $ cd php
  $ ./docker_container build
  ```

This may take several minutes depending on your internet connection and computer configuration.

*Note: if errors occur, refer to [#troubleshooting](#troubleshooting) session

## Running

Run `docker_container` from the project root
```bash
$ ./docker_container start
  ```

Available commands for `docker_container`:
```
- `start`   # starts the container
- `stop`    # stops the container
- `restart` # stops and start the container. If no container found, it just starts
- `build`   # builds the container
- `attach`  # attaches to the started container using `bash`
```

## Troubleshooting

In case the command `docker_container` return error when called, check it's permissions, it must be executable.
If it's not, run the following command:

```bash
$ chmod +x docker_container
```

and try to run it again:

```bash
$ ./docker_container start
```
