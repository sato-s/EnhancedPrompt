
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'enhanced_shell_ps1'

include EnhancedShellPs1

ps1 = PS1.new("/home/sato")
puts ps1.ip.to_s