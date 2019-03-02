# Search app

## Setup
```sh
$ git git@github.com:Vasyl78/search_app.git
$ cd search_app
$ rvm use ruby-2.5.3
# If you do not have installed this version of ruby please install it.
$ rvm install 2.5.3 # or $ rvm install ruby-2.5.3
$ bundle
$ cp config/database.yml.example config/database.yml
```
```sh
$ rails db:setup
```
```sh
$ rails s
```
