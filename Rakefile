require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'jeweler'

if ENV['BUNDLE'] == 'true'
  begin
    require 'bundler'
    Bundler.setup
  rescue LoadError
    puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
  end
end

Jeweler::Tasks.new do |gem|
  gem.name = "residence"
  gem.summary = %Q{A carbon model}
  gem.description = %Q{A software model in Ruby for the greenhouse gas emissions of an residence}
  gem.email = "andy@rossmeissl.net"
  gem.homepage = "http://github.com/brighterplanet/residence"
      gem.authors = ["Andy Rossmeissl", "Seamus Abshere", "Ian Hough", "Matt Kling", 'Derek Kastner']
  gem.files = ['LICENSE', 'README.rdoc'] + 
    Dir.glob(File.join('lib', '**','*.rb'))
  gem.test_files = Dir.glob(File.join('features', '**', '*.rb')) +
    Dir.glob(File.join('features', '**', '*.feature')) +
    Dir.glob(File.join('lib', 'test_support', '**/*.rb'))
  gem.add_development_dependency 'activerecord', '>=3.0.0.beta4'
  gem.add_development_dependency 'bundler', '>=1.0.0.beta.2'
  gem.add_development_dependency 'cucumber', '>=0.8.3'
  gem.add_development_dependency 'jeweler', '>=1.4.0'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rdoc'
  gem.add_development_dependency 'rspec', '>=2.0.0.beta.17'
  gem.add_development_dependency 'sniff', '>=0.0.15' unless ENV['LOCAL_SNIFF']
  gem.add_dependency 'emitter', '>= 0.0.8'
end
Jeweler::GemcutterTasks.new

Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "residence #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'cucumber'
  require 'cucumber/rake/task'

  Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = "features --format pretty"
  end
rescue LoadError
  puts "Cucumber not available, `gem install cucumber`"
end
