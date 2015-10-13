require "enhanced_prompt/version"
require 'enhanced_prompt/prompt'

module EnhancedPrompt
  def run(str=nil,&code)
    prompt=Prompt.new()
    if block_given?
      prompt.instance_eval(&code)
    else
      prompt.instance_eval(str)
    end
  end
  module_function :run
end

