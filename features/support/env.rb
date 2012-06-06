require 'bundler'
Bundler.setup

require 'cucumber'
require 'cucumber/formatter/unicode'

require 'sniff'
Sniff.init File.expand_path('../..', File.dirname(__FILE__)), :earth => [:residence, :locality], :cucumber => true, :logger => $stderr

ActiveRecord::Base.logger.level = Logger::DEBUG
