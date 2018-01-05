# django-docker
# WIP: None of this currently work.

Simple docker image based on ubuntu 16.04 so one can test without
interference from local packages.

### Usage
Idea is simple, pull the repository, build an image with the path to your
source files.

### Build the image
Should probably allow for building different images depending on what
env is going to be tested.

```bash
sudo docker build -t py36-postgres
sudo docker build -t py35-postgres
```

### Run the tests
~~Currently I have only tested this on these two environments.~~

#### py36-postgres
```bash
sudo docker run -v /path/to/source:/django:ro --rm -ti --name py36-postgres
 -c 'cd /django/tests && PYTHONPATH=..:$PYTHONPATH tox -e py36-postgres -- --settings=dev
```

#### py35-postgres

```bash
sudo docker run -v /path/to/source:/django:ro --rm -ti --name py35-postgres
 -c 'cd /django/tests && PYTHONPATH=..:$PYTHONPATH tox -e py35-postgres -- --settings=dev
```
Hint: Notice /path/to/source

