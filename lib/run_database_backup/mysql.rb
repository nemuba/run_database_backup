# frozen_string_literal: true

require "time"
require "fileutils"

module RunDatabaseBackup
  # Class to backup MySQL
  # Description: This class is responsible for backing up MySQL databases
  class Mysql
    # @param uri [String] MySQL URI
    # @param database_name [String] Database name
    # @param backup_directory [String] Backup directory
    def initialize(uri:, database_name:, backup_directory:)
      @uri = uri
      @database_name = database_name
      @backup_directory = backup_directory
      @file_path = "#{@backup_directory}/#{@database_name}-#{Time.now.strftime("%Y%m%d%H%M%S")}.gz"
    end

    # Dump MySQL database
    # Description: This method is responsible for backing up MySQL databases
    def dump
      # Check if the backup directory exists
      FileUtils.mkdir_p(backup_directory) unless File.directory?(backup_directory)

      # Cmd to backup MySQL database
      cmd = "mysqldump #{uri} #{database_name} | gzip > #{file_path}"

      # Execute cmd
      system(cmd)

      # Output
      puts "Backup of MySQL database #{database_name} completed"
      puts "Backup directory: #{file_path}"
    rescue StandardError
      puts "Error: Backup of MySQL database #{database_name} failed"
      puts "Verify if the MySQL URI is correct and if the database name is correct"
      puts "Verify if the MySQL database is running and command mysqldump are installed"
    end

    private

    attr_reader :uri, :database_name, :backup_directory, :file_path
  end
end
