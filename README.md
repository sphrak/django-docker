# django-docker

### Whats this?
These docker image(s) are intended to be used by django developers to easily
be able to run tests in specific environments - these environments are based on the official django build servers. More about those [here](https://code.djangoproject.com/wiki/Jenkins).

### Why?
There exists an already excellent project [django-box](https://github.com/django/django-box/). However I needed something a bit more lightweight since I am developing on a rather underpowered laptop and
docker is not a fully fledged virtual machine, where as docker-box is thus a bit more gentle
on the hardware.

### Requirements
Currently its expected that you have a postgresql instance available - which
is then configured via a django settings file available in `django/tests/`.
These examples uses `dev.py` in side that folder

### Usage
Idea is simple, pull the repository, build an image with the environment you
require. Then just execute the tests in said environment like shown below.

##### Pull from docker hub
The images are periodically built and available [here](https://hub.docker.com/r/sphrak/django-docker/).
```bash
docker pull sphrak/django-docker:py35-postgres
docker pull sphrak/django-docker:py36-postgres
```

Move onto [Running the tests](https://github.com/sphrak/django-docker#running-the-tests).

##### Build the images yourself
Should probably allow for building different images depending on what
env is going to be tested.

```bash
docker build -t django-docker:py36-postgres -f environments/py36-postgres environments/
```

Or if you want to build every environment use the `build.sh` script.

```bash
./build.sh
```
## Example settings file

```python
import os

DATABASES = {
    'default': {
        'ENGINE': 'django.contrib.gis.db.backends.postgis',
        'USER': 'django',
        'NAME': 'djangotests',
        'PORT': 5432,
    },
    'other': {
        'ENGINE': 'django.contrib.gis.db.backends.postgis',
        'USER': 'django',
        'NAME': 'djangotests2',
        'PORT': 5432,
    },
}

SECRET_KEY = "django_tests_secret_key"

# Use a fast hasher to speed up tests.
PASSWORD_HASHERS = (
    'django.contrib.auth.hashers.MD5PasswordHasher',
)
```
## Running the tests
Currently I have only tested this on these two environments.

#### py36-postgres
```bash
docker run -v $PWD:/django --rm -ti django-docker:py36-postgres bash -c 'cd /django/tests && tox -e py36-postgres -- --settings=dev'
```

#### py35-postgres

```bash
docker run -v $PWD:/django --rm -ti django-docker:py35-postgres bash -c 'cd /django/tests && tox -e py35-postgres -- --settings=dev'
```

## Currently supported environments

* py35-postgres
* py36-postgres
* ...

## Contributing
If you want to add more environments please send a pull request :-)

## Credits
Project was inspired by these projects and articles:

* [django-box](https://github.com/django/django-box/)
* [tests-in-containers](https://www.adelton.com/django/tests-in-container)
