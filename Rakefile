require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern    = File.join(File.dirname(__FILE__), 'spec/**')
  t.rspec_opts = ['-I', File.join(File.dirname(__FILE__), 'lib/**')]
end

task :default => :spec
