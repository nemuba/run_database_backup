# frozen_string_literal: true

module DatabaseBackup
  # Railtie to load rake tasks
  # Description: This class is responsible for loading rake tasks
  class Tasks < Rails::Railtie
    railtie_name :database_backup

    rake_tasks do
      Dir[File.join(File.dirname(__FILE__), '../tasks/*.rake')].each {|f| load f }
    end
  end
end
