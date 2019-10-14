Bookmark manager is a web application for managing URLs.

## Approach

The web application is based on Sinatra framework and Postgresql database.

## User stories implemented

User can have an account
User can CRUD a bookmark
User can leave comment under a bookmark

## Installation & Test

1. Download repo, go to project directory and run:

```bash
> bundle install
```

2. Create database:

```bash
> ./migrate_database.sh
```

For Rspec test, run:

```bash
> rspec
```

## Usage

To host the server on local machine. Fire up the server by running:

```bash
> ruby app.rb
```

Visit the web application at:

```
localhost:3000
```
