# DatabaseBackup

This gem provides rake tasks to backup different types of databases, including MongoDB, Postgres, and MySQL.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
  bundle add database_backup
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
  gem install database_backup
```

## Usage

```bash
# Backup MongoDB
rails mongo:backup[uri,database_name,backup_directory]
# Env vars to set:
# MONGO_URL=mongodb://user:password@host:port
# MONGO_DATABASE=database_name
# MONGO_BACKUP_DIRECTORY='/path/to/backup/directory'
# Obs: set uri as mongodb://user:password@host:port without the database name

# Backup Postgres
rails postgres:backup[uri,database_name,backup_directory]
# Env vars to set:
# POSTGRES_URL=postgres://user:password@host:port
# POSTGRES_DATABASE=database_name
# POSTGRES_BACKUP_DIRECTORY='/path/to/backup/directory'
# Obs: set uri as postgres://user:password@host:port without the database name

# Backup MySQL
rails mysql:backup[uri,database_name,backup_directory]
# Env vars to set:
# MYSQL_URL=mysql2://user:password@host:port
# MYSQL_DATABASE=database_name
# MYSQL_BACKUP_DIRECTORY='/path/to/backup/directory'
#Obs: set uri as mysql2://user:password@host:port without the database name
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nemuba/database_backup.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
