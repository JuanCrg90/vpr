require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "github_changelog_generator/task"
require "standard/rake"

RSpec::Core::RakeTask.new(:spec)

task default: [:standard, :spec]

GitHubChangelogGenerator::RakeTask.new :changelog do |config|
  config.user = "JuanCrg90"
  config.project = "vpr"
  config.since_tag = "0.1.0"
  config.future_release = "2.0.0"
end
