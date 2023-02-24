# frozen_string_literal: true

require "time"
require "fileutils"

module RunDatabaseBackup
  # Class to backup MongoDB
  # Description: This class is responsible for backing up MongoDB databases
  # Example:
  # RunDatabaseBackup::Mongo.new(
  #  uri: 'mongodb://localhost:27017',
  #  database_name: 'my_database',
  #  backup_directory: '/tmp'
  # ).dump
  class Mongo
    # @param uri [String] MongoDB URI
    # @param database_name [String] Database name
    # @param backup_directory [String] Backup directory
    def initialize(uri:, database_name:, backup_directory:)
      @uri = uri
      @database_name = database_name
      @backup_directory = backup_directory
      @file_path = "#{@backup_directory}/#{@database_name}-#{Time.now.strftime("%Y%m%d%H%M%S")}.gz"
    end

    # Dump MongoDB database
    # Description: This method is responsible for backing up MongoDB databases
    # @return [void]
    def dump
      # Check if the backup directory exists
      FileUtils.mkdir_p(backup_directory) unless File.directory?(backup_directory)

      # Cmd to backup MongoDB database
      cmd = "mongodump --uri=#{uri} --db=#{database_name} --gzip --archive=#{file_path}"

      # Execute cmd
      system(cmd)

      # Output
      puts "Backup of MongoDB database #{database_name} completed"
      puts "Backup directory: #{file_path}"
    rescue StandardError
      puts "Error: Backup of MongoDB database #{database_name} failed"
      puts "Verify if the MongoDB URI is correct and if the database name is correct"
      puts "Verify if the MongoDB database is running and command mongodump are installed"
    end

    private

    attr_reader :uri, :database_name, :backup_directory, :file_path
  end
end
