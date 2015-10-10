require_relative 'color_table'
# This monkey patch to String, enable to paint string on ANSI terminal
# Thanks to Rainbow gem we can easily implement colorful string
# Just running 'red'.color(:red), red string appears on terminal
# See
# https://github.com/sickill/rainbow
#
# In addition to the above we implement several utilities and aliases
class String
  include ColorTable
  alias_method :original_color, :color


  alias_method :br, :bright
  alias_method :_, :underline
  alias_method :bg, :background

  # def color(kolor)
  #   string=String.new(self)
  #   string.original_color(color_table[kolor])
  #   string
  #   # if kolor.is_a? Symbol
  #   #   kolor =
  #   #   # if color_table.has_key? c
  #   #   #
  #   #   # end
  #   # end
  #   # original_color(kolor)
  # end
  alias_method :c, :color
end
