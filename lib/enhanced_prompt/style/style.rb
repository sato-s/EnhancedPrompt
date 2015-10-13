class EnhancedPrompt::Prompt
  module Style

    def default
      user.c(:white).bg(:dodger_blue) + '@'.c(:white).bg(:dodger_blue) +
          ip.c(:white).bg(:dodger_blue) +"  ".bg(:dodger_blue)+
          dir_abbreviated2.c(:white).bg(:dodger_blue) + "\n"+
          "->".c(:dark_cyan)
    end

  end
end