[![Build Status](https://travis-ci.org/andela-vkironde/checkpoint-3-bucketlist.svg?branch=develop)](https://travis-ci.org/andela-vkironde/checkpoint-3-bucketlist)

# BCTLST

**Documentation** - [bctlst.herokuapp.com](http://bctlst-api.herokuapp.com).

**Source code** - [https://github.com/andela-vkironde/checkpoint-3-bucketlist](https://github.com/andela-vkironde/checkpoint-3-bucketlist)

# Running the application

### Install dependencies

You need to install the following:

1. [Ruby](https://github.com/rbenv/rbenv)
2. [PostgreSQL](http://www.postgresql.org/download/macosx/)
3. [Bundler](http://bundler.io/)
4. [Rails](http://guides.rubyonrails.org/getting_started.html#installing-rails)
5. [RSpec](http://rspec.info/)

### Clone the repository

Clone the application to your local machine:

```
$ git clone https://github.com/andela-vkironde/checkpoint-3-bucketlist.git
```

Install the dependencies

```
$ bundle install
```

Setup database and seed data

```
$ rails db:setup
```

To run the application;

```
$ rails s
```

To test the application;

```
$ rspec
```

# API limitations

It returns JSON only

# The API Endpoints

Endpoint | Action
-----|-------
POST /signup/ | Create a new user
POST /auth/login/ | Log in existing user
GET /auth/logout/ | Log out existing user
POST /bucketlists/ | Create a new bucket list
GET /bucketlists/ | List all the created bucket lists
GET /bucketlists/{id} | Get single bucket list
PUT /bucketlists/{id} | Update this bucket list
DELETE /bucketlists/{id} | Delete this single bucket list
POST /bucketlists/{bucket_id}/items/ | Create a new item in bucket list
GET /bucketlists/{bucket_id}/items | List all the created items in a bucket list
GET /bucketlists/{bucket_id}/items/{id} | Get a single item in a bucket list
PUT /bucketlists/{bucket_id}/items/{item_id} | Update a bucket list item
DELETE /bucketlists/{bucket_id}/items/{item_id} | Delete an item in a bucket list

# Contributing

1. Fork it!
2. Create your branch: `git checkout -b ft-new-feature`
3. Commit your changes: `git add -A && git commit -m 'Add new feature'`
4. Push to the branch: `git push origin ft-new-feature`
5. Submit a pull request
