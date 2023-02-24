# frozen_string_literal: true

module RunDatabaseBackup
  # Railtie to load rake tasks
  # Description: This class is responsible for loading rake tasks
  class Tasks < Rails::Railtie
    railtie_name :run_database_backup

    rake_tasks do
      load "tasks/run_database_backup.rake"
    end
  end
end
