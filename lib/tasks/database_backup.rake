# frozen_string_literal: true

require "database_backup"

namespace :mongo do
  desc "Backup MongoDB database to a file"
  task :backup, [:uri, :database_name, :backup_directory] do |_task, args|
    args.with_defaults(
      uri: ENV.fetch("MONGODB_URL", nil),
      database_name: ENV.fetch("MONGODB_DATABASE", nil),
      backup_directory: ENV.fetch("MONGODB_BACKUP_DIRECTORY", nil)
    )

    puts "Backup MongoDB database #{args[:database_name]} started"

    DatabaseBackup::Mongo.new(**args).dump

    puts "Backup MongoDB database #{args[:database_name]} completed"
  end
end

namespace :mysql do
  desc "Backup MySQL database to a file"
  task :backup, [:uri, :database_name, :backup_directory] do |_task, args|
    args.with_defaults(
      uri: ENV.fetch("MYSQL_URL", nil),
      database_name: ENV.fetch("MYSQL_DATABASE", nil),
      backup_directory: ENV.fetch("MYSQL_BACKUP_DIRECTORY", nil)
    )

    puts "Backup MySQL database #{args[:database_name]} started"

    DatabaseBackup::Mysql.new(**args).dump

    puts "Backup MySQL database #{args[:database_name]} completed"
  end
end

namespace :postgresql do
  desc "Backup PostgreSQL database to a file"
  task :backup, [:uri, :database_name, :backup_directory] do |_task, args|
    args.with_defaults(
      uri: ENV.fetch("POSTGRESQL_URL", nil),
      database_name: ENV.fetch("POSTGRESQL_DATABASE", nil),
      backup_directory: ENV.fetch("POSTGRESQL_BACKUP_DIRECTORY", nil)
    )

    puts "Backup PostgreSQL database #{args[:database_name]} started"

    DatabaseBackup::Postgresql.new(**args).dump

    puts "Backup PostgreSQL database #{args[:database_name]} completed"
  end
end
