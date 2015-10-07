$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'enhanced_shell_ps1'

include EnhancedShellPs1

ps1 = PS1.new

EnhancedShellPs1::PS1.instance_methods(false).each do |met|
  puts "#{met} : #{ps1.send(met)}".red
end