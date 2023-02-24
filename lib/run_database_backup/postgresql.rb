# frozen_string_literal: true

require "time"
require "fileutils"

module RunDatabaseBackup
  # Class to backup PostgreSQL
  # Description: This class is responsible for backing up PostgreSQL databases
  class Postgresql
    # @param uri [String] PostgreSQL URI
    # @param database_name [String] Database name
    # @param backup_directory [String] Backup directory
    def initialize(uri:, database_name:, backup_directory:)
      @uri = uri
      @database_name = database_name
      @backup_directory = backup_directory
      @file_path = "#{@backup_directory}/#{@database_name}-#{Time.now.strftime("%Y%m%d%H%M%S")}.gz"
    end

    # Dump PostgreSQL database
    # Description: This method is responsible for backing up PostgreSQL databases
    def dump
      # Check if the backup directory exists
      FileUtils.mkdir_p(backup_directory) unless File.directory?(backup_directory)

      # Cmd to backup PostgreSQL database
      cmd = "pg_dumpall -a #{uri} -d #{database_name} | gzip > #{file_path}"

      # Execute cmd
      system(cmd)

      # Output
      puts "Backup of PostgreSQL database #{database_name} completed"
      puts "Backup directory: #{file_path}"
    rescue StandardError
      puts "Error: Backup of PostgreSQL database #{database_name} failed"
      puts "Verify if the PostgreSQL URI is correct and if the database name is correct"
      puts "Verify if the PostgreSQL database is running and command pg_dumpall are installed"
    end

    private

    attr_reader :uri, :database_name, :backup_directory, :file_path
  end
end
