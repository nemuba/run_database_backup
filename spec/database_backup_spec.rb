# frozen_string_literal: true

RSpec.describe DatabaseBackup do
  it "has a version number" do
    expect(DatabaseBackup::VERSION).not_to be nil
  end
end
