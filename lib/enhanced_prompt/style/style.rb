class EnhancedPrompt::Prompt
  module Style

    def default2
      user.c(:white).bg(:dodger_blue) + '@'.c(:white).bg(:dodger_blue) +
          ip.c(:white).bg(:dodger_blue) +"  ".bg(:dodger_blue)+
          dir_abbreviated2.c(:white).bg(:dodger_blue) + "\n"+
          "->".c(:dark_cyan)
    end

    def default
      time1.c(:green)+ " #{user} ".c(:aqua)+ git.c(:red)+ "\n"+
      "#{dir_abbreviated2(20)} $".c(:white)
    end

  end
end