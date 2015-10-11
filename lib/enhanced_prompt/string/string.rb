require 'rainbow'
require_relative 'color_table'
# This monkey patch to String, enable to paint string on ANSI terminal
# Thanks to Rainbow gem we can easily implement colorful string
# Just running 'red'.color(:red), red string appears on terminal
# See
# https://github.com/sickill/rainbow
#
# In addition to the above we implement several utilities and aliases
module EnhancedPrompt::StringExtension
  include ColorTable

  def c(kolor)
    if kolor.is_a? Symbol || color_table.has_key?(kolor)
      return Rainbow(self).color(color_table[kolor])
    end
    Rainbow(self).color(kolor)
  end

  def bg(kolor)
    if kolor.is_a? Symbol || color_table.has_key?(kolor)
      return Rainbow(self).background(color_table[kolor])
    end
    Rainbow(self).background(kolor)
  end

  def _
    Rainbow(self).underline
  end

  def br
    Rainbow(self).bright
  end

end

String.prepend EnhancedPrompt::StringExtension
