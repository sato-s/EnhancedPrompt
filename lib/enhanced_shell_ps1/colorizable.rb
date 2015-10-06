# TODO should be colorable ?

module Colorizable
  def colorize(str,color)
    color = color.to_sym if color.kind_of? String
    if colors.has_key? color then
      "\[$(tput setaf #{@colors[color]})\]#{str}\[$(tput sgr0)\]"
    else
      str
    end
  end
end