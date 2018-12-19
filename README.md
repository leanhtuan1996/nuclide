# What's nuclide-remote
The Nuclide-remote Docker container enables remote editing with Nuclide.
Further documentation about Nuclide can be found at:
https://nuclide.io/docs/features/remote/

# TL;DR;

```bash
$ docker run -d -p 9090:9090 -p 9091:22 -v /app:/app jotadrilo/nuclide-remote:latest
```

# Prerequisites

To run nuclide-remote you need [Docker Engine](https://www.docker.com/products/docker-engine) >= `1.10.0`. You will also need to install the *nuclide* [community package](https://nuclide.io/docs/features/remote/) to run with [Atom](https://atom.io/).

# How to use this image

## Using the Docker Command Line

If you want to run the application manually instead of using docker-compose, these are the basic steps you need to run:

1. Run the Nuclide container:

  ```bash
  $ docker run -d -p 9090:9090 -p 9091:22 -v /app:/app jotadrilo/nuclide-remote:latest
  ```

2. On the local machine start Atom
3. Open the *Home* pane.
4. Select *Remote connection* and enter the connection information:

- Username: `root`
- Server: `localhost`
- Initial Directory: `/app`
- Password: `nuclide`
- SSH Port: `9091`
- Remote Server Command: `nuclide-start-server -p 9090`

After pressing ok the remote directory will show up and will be ready for editing.

# Configuration

## Environment variables

The Nuclide instance can be customized by specifying environment variables on the first run:

- `NUCLIDE_VERSION`: Nuclide module version to install via npm. No defaults.
- `USERNAME`: System username to configure and ssh with. Default: **root**
- `PASSWORD`: System password to configure and ssh with. Default: **nuclide**
- `AUTHORIZED_KEYS`: Base64-encoded authorized_keys file. No defaults.

### Specifying Environment variables on the Docker command line

```bash
$ docker run -d --name nuclide -p 9090:9090 -p 9091:22 \
  --volume /app:/app \
  --env NUCLIDE_VERSION=0.205.0\
  --env USERNAME=foo \
  --env PASSWORD=bar \
  --env AUTHORIZED_KEYS="`base64 ~/.ssh/authorized_keys`" \
  jotadrilo/nuclide-remote:latest
```

# Details

## Version

The image ships the latest Nuclide IDE version. You can also specify a different version at runtime by setting an environment variable. See [Environment variables](#environment-variables) section for more info.

## Connectivity

Communication between Nuclide and Nuclide-remote uses 2 ports:

- `ssh/22`: needed to start nuclide remote inside Docker container
- `9090`: the Nuclide communication channel

# Issues

If you encountered a problem running this container, you can file an [issue](https://github.com/jotadrilo/nuclide-remote/issues). For us to provide better support, be sure to include the following information in your issue:

- Host OS and version
- Docker version (`$ docker version`)
- Output of `$ docker info`
- The command you used to run the container, and any relevant output you saw (masking any sensitive information)

# Contributing
