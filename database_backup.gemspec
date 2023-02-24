# frozen_string_literal: true

require_relative "lib/database_backup/version"

Gem::Specification.new do |spec|
  spec.name = "database_backup"
  spec.version = DatabaseBackup::VERSION
  spec.authors       = ["Alef Ojeda de Oliveira"]
  spec.email         = ["nemubatubag@gmail.com"]
  spec.description   = "A RubyGem to backup different types of databases"
  spec.summary       = "RubyGem for Database Backup"
  spec.homepage      = "https://github.com/nemuba/database_backup"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = "https://github.com/nemuba/database_backup"
  spec.metadata["source_code_uri"] = "https://github.com/nemuba/database_backup"
  spec.metadata["changelog_uri"] = "https://github.com/nemuba/database_backup/blob/main/CHANGELOG.md"
  spec.metadata["documentation_uri"] = "https://rubydoc.info/github/nemuba/database_backup/main"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "rails", ">= 5.2"
  spec.add_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.10"
  spec.add_development_dependency "rubocop", "~> 1.21"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
