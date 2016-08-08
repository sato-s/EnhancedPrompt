require 'rainbow/ext/string'
# This monkey patch to String, enable to paint string on ANSI terminal
# Thanks to Rainbow gem we can easily implement colorful string
# Just running 'red'.color(:red), red string appears on terminal
# See
# https://github.com/sickill/rainbow
#
# In addition to the above we implement several utilities and aliases


module EnhancedPrompt
  module Ext
    module InstanceMethods
      

      def background(value)

      end

      def color(value)
        
      end

      def blink

      end

      def underbar

      end


      alias_method :c, :color
      alias_method :bg, :background
    end
  end
end


# Here we monkey patch String with above instance methods
class ::String
  include EnhancedPrompt::Ext::InstanceMethods
end
