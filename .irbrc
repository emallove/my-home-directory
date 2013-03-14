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

IRB.conf[:SAVE_HISTORY] = 2000
IRB.conf[:HISTORY_FILE] = '/home/emallove/.irb-history'
IRB.conf[:EVAL_HISTORY] = 200

# Emits a ton of verbose output from $HOME/.rvm/rubies
#
# IRB.conf[:USE_TRACER] = true


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
