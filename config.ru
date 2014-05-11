# This file is used by Rack-based servers to start the application.

require 'vcr'
require 'webmock'

VCR.configure do |c|
  c.cassette_library_dir  = './cache/'
  c.hook_into :webmock
end
use VCR::Middleware::Rack do |cassette|
  cassette.name     'cassette'
  cassette.options  :record => :new_episodes,  
                    :re_record_interval => 5.minutes, # expire every 5 minutes
                    :match_requests_on => [:host, :path]
end

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application
