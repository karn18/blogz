require "optparse"
require "rubocop/rake_task"

task default: [:rubocop]

desc "Run rubocop"
task :rubocop do
  opts = current_options
  RuboCop::RakeTask.new do |task|
    task.options = opts
  end
end

private

def current_options
  opts = OptionParser.new
  opts.on("-a")
  opts.on("-A")
  opts.order!(ARGV) {}
end
