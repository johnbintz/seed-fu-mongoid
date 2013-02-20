I missed [Seed Fu](https://github.com/mbleigh/seed-fu) when I was working on a Mongoid app, so I hacked this together in about 20 minutes.
No tests whatsoever but it works with my very simple Seed Fu-like seed data, so if you like it, contribute some tests!

## Usage

Seed files in `db/fixtures/*.rb`:

``` ruby
PermissionType.seed(id: 1, type: 'Users')
PermissionType.seed(id: 2, type: 'Sites')
PermissionType.seed(id: 3, type: 'Cats')
```

Then `rake db:seed_fu` if you're in Rails.

Simple!

### Capistrano

`require 'seed-fu-mongoid/capistrano'` to have your data get re-seeded on deploy.

