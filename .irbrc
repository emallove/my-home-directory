require 'rubygems'
require 'ap'

require 'irb/completion'
require 'irb/ext/save-history'

begin
  # load wirble
  require 'wirble'

  # start wirble (with color)
  Wirble.init
  Wirble.colorize
rescue LoadError => err
  warn "Couldn't load Wirble: #{err}"
end

IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = '/home/emallove/.irb-history'

ARGV.concat [ "--readline",
              "--prompt-mode",
              "simple" ]

# script_console_running = ENV.include?('RAILS_ENV') && IRB.conf[:LOAD_MODULES] && IRB.conf[:LOAD_MODULES].include?('console_with_helpers') 
# rails_running = ENV.include?('RAILS_ENV') && !(IRB.conf[:LOAD_MODULES] && IRB.conf[:LOAD_MODULES].include?('console_with_helpers'))
# irb_standalone_running = !script_console_running && !rails_running
# 
# if script_console_running
#   require 'logger'
#   Object.const_set(:RAILS_DEFAULT_LOGGER, Logger.new(STDOUT))
# end
