require 'bundler'
Bundler.setup

require 'cucumber'
require 'cucumber/formatter/unicode'

require 'data_miner'
DataMiner.logger = Logger.new nil

require 'sniff'
Sniff.init File.expand_path('../..', File.dirname(__FILE__)), :earth => [:residence, :locality], :cucumber => true, :logger => 'log/test_log.txt'
