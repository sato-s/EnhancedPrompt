require "enhanced_prompt/version"
require 'enhanced_prompt/prompt'

module EnhancedPrompt
  VERSION = "0.1.0"
  # Run Proc
  def run(&code)
    ps1 = Prompt.new
    ps1.instance_eval(&code)
  end

  # Run String
  def eval(code)
    ps1 = Prompt.new
    ps1.instance_eval(code)
  end
  module_function :run, :eval
end

