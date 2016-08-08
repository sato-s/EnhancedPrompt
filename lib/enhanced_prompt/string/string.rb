require 'rainbow'
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
      

      def bg(value)
        Rainbow(self).bg(value)
      end

      def c(value)
        Rainbow(self).color(value)
      end

      def blink
        Rainbow(self).blink
      end

      def _
        Rainbow(self).underline
      end


      alias_method :color, :c
      alias_method :background, :bg 
    end
  end
end


# Here we monkey patch String with above instance methods
class ::String
  include EnhancedPrompt::Ext::InstanceMethods
end
