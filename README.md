# dwellNV Rails App
For organizing and managing listings and clients.

## Commands

Gem bundle install without production:

```
$ bundle install --without production
```

Database migration:

```
$ rails db:migrate
```

Rails testing suite:

```
$ rails test
```

Rails local server:

```
$ rails server
```

Heroku from Branch:

```
$ git checkout master
$ git merge static-pages
$ git push
$ rails test
$ git push heroku
```