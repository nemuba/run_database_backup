# frozen_string_literal: true

require_relative "database_backup/version"
require_relative "database_backup/mongo"
require_relative "database_backup/mysql"
require_relative "database_backup/postgresql"
require_relative "database_backup/tasks"

# Module to backup databases
# Description: This module is responsible for backing up databases
# Example: DatabaseBackup::Mongo.new(uri: 'mongodb://localhost:27017', database_name: 'my_database', backup_directory: '/tmp').dump
# Example: DatabaseBackup::Mysql.new(uri: 'mysql://localhost:3306', database_name: 'my_database', backup_directory: '/tmp').dump
# Example: DatabaseBackup::Postgres.new(uri: 'postgres://localhost:5432', database_name: 'my_database', backup_directory: '/tmp').dump
module DatabaseBackup
  class << self
    # @return [String] version
    def version
      DatabaseBackup::VERSION
    end
  end
end
