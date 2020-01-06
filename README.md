# NYC Tour Backend

![nycTourApp](https://nyc-tour-app.s3.us-east-2.amazonaws.com/pigeon.gif)

## First time setup
- Install ruby version specified (here)[https://github.com/jeffthemaximum/nyc_tour_backend/blob/master/.ruby-version].
  - We recommend using (rvm)[https://rvm.io/] to manage ruby versions.
- Install postgres.
  - We recommend using (postgres.app)[https://postgresapp.com/] on mac.
- Install (bundler)[https://bundler.io/].
- Install dependencies. In root of repo, run:
```
bundle install
```
- Setup the database. In root of repo, run:
```
rails db:create
rails db:migrate
rails db:seed
```

## To run
- In the root of the repo, run:
```
bundle exec rails s
```

## More details
- There's two main pieces of functionality: **1) All the API endpoints** and **2) An admin website**.
- The API endpoints exist in (here)[https://github.com/jeffthemaximum/nyc_tour_backend/tree/master/app/controllers/api/v1].
  - Right now, the only functional one is POST `api/v1/users`
  - You can create a new user with
  ```
  POST http://localhost:3000/api/v1/user
  {
    "email": "someone@email.com",
    "password": "atleast6chars"
  }
  ```
- The admin website is available at http://localhost:3000/admin
  - You can login locally with the user created (here)[https://github.com/jeffthemaximum/nyc_tour_backend/blob/master/db/seeds.rb].

## backend todos
- [X] active admin
  - https://blog.heroku.com/a-rock-solid-modern-web-stack
- [X] jwt auth
  - https://github.com/jeffthemaximum/mals-api/blob/master/lib/auth_util.rb
- [ ] setup stathat (https://github.com/jeffthemaximum/mals-api)
- [X] annotate
- [X] vscode debugger
- [ ] setup testing
- [X] namespace api routes
- [ ] setup models
  - [ ] tour
  - [ ] destination
  - [X] user


## frontend todos
- design
  - [X] design signup
  - [ ] design login
- code
  - [X] see how expo uses react native navigation
  - [ ] connect signup to backend
  - [ ] connect login to backend
