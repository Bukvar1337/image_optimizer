## Running this app

You'll need to have [Docker installed](https://docs.docker.com/get-docker/).

#### Clone this repo anywhere you want and move into the directory:

```sh
git clone https://github.com/Bukvar1337/image_optimizer.git
cd image_optimizer
```

#### Copy a few example files because the real files are git ignored:

```sh
cp .env.example .env
cp docker-compose.override.yml.example docker-compose.override.yml
```

#### Edit .env file with gmail account params
```sh
export SMTP_USER=username
export SMTP_PASS=password
export FROM_MAIL=username@gmail.com
```
#### Give an app an access to use smtp
[Give access](https://myaccount.google.com/u/0/lesssecureapps)
#### Build everything:

```sh
docker-compose up --build
```

#### Setup the initial database:

```sh
./run rails db:setup
```
