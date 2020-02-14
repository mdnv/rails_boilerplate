# Source information
* Ruby version:   2.6.5
* Rails:          6.2.0.1
* Developer:      Vuong Khai Ha

# Features in future
- Capistrano for deployment
- Docker
- CI/CD
- Unit test
...

# How to build source code
1. Install environment:
https://gorails.com/setup
2. Copy and rename file: `.env.example` to be `.env` and change configs.
3. Install gems:
```
bundle install
```
4. Install yarn for webpack:
```
yarn install
```
5. Create database and seed data
```
rails db:create db:migrate db:seed
```
6. Run rails server
```
rails s
```

# Syntax validation
Check ruby syntax
```
bundle exec rubocop
```
Check slim syntax
```
slim-lint app/**/*.slim
```
Check stylesheets syntax
```
bundle exec scss-lint app/javascript/assets/stylesheets
```
