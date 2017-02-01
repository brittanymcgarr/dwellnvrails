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
$ heroku run rails db:migrate
```

Rails Active Record (db commands):

Rails Console (Sandbox mode):
```
$ rails console --sandbox
```

Creating a new User:
```
$ user = User.new(name:"Name", email:"email@email.com")
$ user.save

-or-
$ user = User.create(name: "Name", email: "email@email.com")
```

Destroying a User entry:
```
$ user.destroy
```

Checking validity:
```
$ user.valid?
```

Finding User:
```
$ User.find(1)
$ User.find_by(name: "Name")
$ User.first
$ User.all
```
