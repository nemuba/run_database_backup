# frozen_string_literal: true

require_relative "run_database_backup/version"
require_relative "run_database_backup/mongo"
require_relative "run_database_backup/mysql"
require_relative "run_database_backup/postgresql"
require_relative "run_database_backup/tasks"

# Module to backup databases
# Description: This module is responsible for backing up databases
module RunDatabaseBackup
  class << self
    # @return [String] version
    def version
      RunDatabaseBackup::VERSION
    end
  end
end
