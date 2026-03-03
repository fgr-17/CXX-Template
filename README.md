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

### b) Code quality tools

CMake has built-in features to connect with code quality tools and analyze the code that is being compiled.
In the current version of this repo, the following tools has been configured:

* clang-tidy
* clang-format
* iwyu

Those tools are triggered from CMake in the following lines on the general CMakeLists.txt

~~~CMake
set(CMAKE_CXX_CLANG_TIDY "clang-tidy")
set(CMAKE_CXX_CLANG_FORMAT "clang-format")
set(CMAKE_CXX_INCLUDE_WHAT_YOU_USE "iwyu")
~~~

If you run into clang-tidy issues, there's a `make fix` target that can do the work for you

## Test suite

Unit test are based on gtest and gmock. To run tests, jump into the container and run:

~~~bash
cd build
cmake ..
make test
~~~

## Building the sources:

This project is based on CMake. To compile everything 

~~~bash
mkdir -p build
cd build
cmake ..
make
~~~

The executable files can be found at:

- app: build/src/cxx_app
- test suite: build/test/test_suite
