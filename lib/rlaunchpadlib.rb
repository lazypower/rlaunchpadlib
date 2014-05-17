require "rlaunchpadlib/version"
require "httparty"
Dir[File.dirname(__FILE__) + '/rlaunchpadlib/*.rb'].each do |file|
  require file
end

module Rlaunchpadlib
  # Your code goes here...
end
