# C++ Repository Template

**Author:**

# Repo information:

## Installation

This repo can be built and deployed inside a container based on Debian Jessie Slim

### a) Build and deploy from docker command line:

- Open a terminal(Unix or macOS) or PowerShell in Windows and cd into the project folder

- Build the docker image:

```bash
docker-compose up -d
```

- Run the container and share the project folder with it:

```bash
docker exec -it cxx-template bash
```

## Test suite

Unit test are based on Catch2 and FakeIt. These libs are added as submodules. Be sure to clone the repository using

```git
git clone <URL> --recursive
```

Or once the repository was cloned, then run:

```git
git submodule update --init
```

Catch2 needs to be installed on the container. This can be easily done by executing:

```bash
cd scripts
./install-catch2.sh
```

## Building the sources:

This project is based on cmake. In order to simplify the process, a script called <build-all.sh> is provided. It's a bash script, so it can be run inside the container, or on a Unix-macOS environment. This script will generate all the building files and the docs (based on doxygen). Just run:

```bash
cd scripts
./build-all.sh
```

To compile natively on Windows, please open a cmd.exe or PowerShell terminal, cd into the project folder and run:

```
mkdir -p build
cd build
cmake ..\

```

The executable files can be found at:

- app: build/src/cxx_app
- test suite: build/test/test_suite
