require 'bundler'

task :install do
	Bundler::GemHelper.install_tasks
end

task :default => :test

task :test do
  FileList["test/test_*"].each do |file|
    ruby "#{file}"
  end
end
