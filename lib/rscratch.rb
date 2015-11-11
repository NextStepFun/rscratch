require "rscratch/version"
require 'gosu'
RSCRATCH_BASEDIR = File.dirname(__FILE__)
Dir[RSCRATCH_BASEDIR + '*.rb'].each {|file| require file }
