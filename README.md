## Requirements

### [Docker](https://www.docker.com/products/overview)

[Download Mac](https://download.docker.com/mac/stable/Docker.dmg) -
[Download Windows](https://download.docker.com/win/stable/InstallDocker.msi)

## Setup

1. Install docker

2. Clone this repository 
  ```bash
  $ git clone https://github.com/evertonfragoso/php.git
  ```

3. Build the container
  ```bash
  $ cd php
  $ docker build -t php-server .
  ```

This may take several minutes depending on your internet connection and computer configuration.

## Running

Run `docker_container` from the project root
```bash
$ ./docker_container start
  ```

Available commands for `docker_container`:
  - `$ ./docker_container start`
  - `$ ./docker_container stop`
  - `$ ./docker_container restart`


### Troubleshooting

In case the command `docker_container` return error when called, check it's permissions, it must be executable.
If it's not, run the following command:

```bash
$ chmod +x docker_container
```

and try to run it again:

```bash
$ ./docker_container start
```
