require 'cucumber/rake/task'

namespace :cucumber do
  vendored_cucumber_bin = Dir[Rails.root.join('vendor/{gems,plugins}/cucumber*/bin/cucumber')].first

  Cucumber::Rake::Task.new(:ok, 'Run features that should pass') do |t|
    t.binary = vendored_cucumber_bin # If nil, the gem's binary is used.
    t.fork = true # You may get faster startup if you set this to false
    t.profile = 'default'
  end

  task default: :cucumber
end
