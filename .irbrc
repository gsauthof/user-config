require 'irb/completion'

require 'irb/ext/save-history'
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]
IRB.conf[:SAVE_HISTORY] = 2048
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.cache/irb_history" 

