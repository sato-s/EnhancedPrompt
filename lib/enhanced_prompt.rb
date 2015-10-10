require "enhanced_prompt/version"
require 'enhanced_prompt/prompt'

module EnhancedPrompt

  # Run Proc
  def run(&code)
    prompt=Prompt.new()
    prompt.instance_eval(&code)
  end

  # Run String
  def eval(code)
    prompt=Prompt.new()
    prompt.instance_eval(code)
  end
  module_function :run, :eval
end

