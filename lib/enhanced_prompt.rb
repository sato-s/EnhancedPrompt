require "enhanced_prompt/version"
require 'enhanced_prompt/token'
require 'enhanced_prompt/string'
require 'enhanced_prompt/counter'

module EnhancedPrompt
  # Run Proc
  def run(&code)
    ps1 = Token.new
    ps1.instance_eval(&code)
  end

  # Run String
  def eval(code)
    ps1 = Token.new
    ps1.instance_eval(code)
  end
  module_function :run, :eval
end

