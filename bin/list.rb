$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'enhanced_prompt'

include EnhancedPrompt

ps1 = Prompt.new

EnhancedPrompt::Prompt.instance_methods(false).each do |met|
  puts "#{met} : #{ps1.send(met)}".red
end