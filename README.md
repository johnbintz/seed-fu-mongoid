I missed [Seed Fu](https://github.com/mbleigh/seed-fu) when I was working on a Mongoid app, so I hacked this together in about 20 minutes.
No tests whatsoever but it works with my very simple Seed Fu-like seed data, so if you like it, contribute some tests!

## Usage

Seed files in `db/fixtures/*.rb`:

``` ruby
PermissionType.seed do |s|
  s.id = 1
  s.type = 'Users'
end

PermissionType.seed do |s|
  s.id = 2
  s.type = 'Sites'
end
```

Then `rake db:seed_fu` if you're in Rails.

Simple!

### Capistrano

`require 'seed-fu-mongoid/capistrano'` to have your data get re-seeded on deploy.

