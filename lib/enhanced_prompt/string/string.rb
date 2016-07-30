require 'rainbow'
require 'rainbow/ext/string'
require_relative 'predefined_color'
# This monkey patch to String, enable to paint string on ANSI terminal
# Thanks to Rainbow gem we can easily implement colorful string
# Just running 'red'.color(:red), red string appears on terminal
# See
# https://github.com/sickill/rainbow
#
# In addition to the above we implement several utilities and aliases
class Rainbow::Presenter
  include EnhancedPrompt::StringExtension::PredefinedColor
  undef bg
  def bg(kolor)
    if kolor.is_a? Symbol
      if color_table.has_key?(kolor)
        begin
          str =Rainbow(self).background(color_table[kolor])
          return str
        rescue
          raise ArgumentError,' Missuse of rainbow interface'
        end
      else
        raise ArgumentError,'No such color'
      end
    end
    begin
      Rainbow(self).background(kolor)
    rescue
      raise ArgumentError,' Missuse of rainbow interface'
    end
  end
end

module EnhancedPrompt::StringExtension
  include EnhancedPrompt::StringExtension::PredefinedColor
end

String.include EnhancedPrompt::StringExtension