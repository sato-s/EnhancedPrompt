# This monkey patch to String, enable to paint string on ANSI terminal
# Thanks to Rainbow gem we can easily implement colorful string
# Just running "red".color(:red), red string appears on terminal
# See
# https://github.com/sickill/rainbow
#
# In addition to this we implement several utilities
require 'rainbow/ext/string'
class String
  alias :c :color
end