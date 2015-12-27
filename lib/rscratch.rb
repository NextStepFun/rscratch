require "rscratch/version"
require 'gosu'
RSCRATCH_BASEDIR = File.dirname(__FILE__)
Dir[RSCRATCH_BASEDIR + '/rscratch/*.rb'].each {|file| require file }
Dir[RSCRATCH_BASEDIR + '/rscratch/dsl/*.rb'].each {|file| require file }
