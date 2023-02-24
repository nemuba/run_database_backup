# frozen_string_literal: true

module DatabaseBackup
  # Railtie to load rake tasks
  # Description: This class is responsible for loading rake tasks
  class Tasks < Rails::Railtie
    rake_tasks do
      load "database_backup/tasks/database_backup.rake"
    end
  end
end
