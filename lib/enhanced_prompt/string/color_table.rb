module EnhancedPrompt
 module StringExtension

 end
end

module EnhancedPrompt::StringExtension
  module ColorTable
    def color_table
                   {:aqua=>'#00FFFF', :aquamarine=>'#7FFFD4', :medium_aquamarine=>'#66CDAA',
                    :azure=>'#F0FFFF', :beige=>'#F5F5DC', :bisque=>'#FFE4C4', :black=>'#000000',
                    :blanched_almond=>'#FFEBCD', :blue=>'#0000FF', :dark_blue=>'#00008B',
                    :light_blue=>'#ADD8E6', :medium_blue=>'#0000CD', :alice_blue=>'#F0F8FF',
                    :cadet_blue=>'#5F9EA0', :dodger_blue=>'#1E90FF', :midnight_blue=>'#191970',
                    :navy_blue=>'#000080', :powder_blue=>'#B0E0E6', :royal_blue=>'#4169E1',
                    :sky_blue=>'#87CEEB', :deep_sky_blue=>'#00BFFF', :light_sky_blue=>'#87CEFA',
                    :slate_blue=>'#6A5ACD', :dark_slate_blue=>'#483D8B', :medium_slate_blue=>'#7B68EE',
                    :steel_blue=>'#4682B4', :light_steel_blue=>'#B0C4DE', :brown=>'#A52A2A',
                    :rosy_brown=>'#BC8F8F', :saddle_brown=>'#8B4513', :sandy_brown=>'#F4A460',
                    :burlywood=>'#DEB887', :chartreuse=>'#7FFF00', :chocolate=>'#D2691E',
                    :coral=>'#FF7F50', :light_coral=>'#F08080', :cornflower=>'#6495ED',
                    :cornsilk=>'#FFF8DC', :crimson=>'#DC143C', :cyan=>'#00FFFF',
                    :dark_cyan=>'#008B8B', :light_cyan=>'#E0FFFF', :firebrick=>'#B22222',
                    :fuchsia=>'#FF00FF', :gainsboro=>'#DCDCDC', :gold=>'#FFD700',
                    :goldenrod=>'#DAA520', :dark_goldenrod=>'#B8860B', :light_goldenrod=>'#FAFAD2',
                    :pale_goldenrod=>'#EEE8AA', :gray=>'#BEBEBE', :dark_gray=>'#A9A9A9',
                    :dim_gray=>'#696969', :light_gray=>'#D3D3D3', :slate_gray=>'#708090',
                    :light_slate_gray=>'#778899', :web_gray=>'#808080', :green=>'#00FF00',
                    :dark_green=>'#006400', :light_green=>'#90EE90', :pale_green=>'#98FB98',
                    :dark_olive_green=>'#556B2F', :yellow_green=>'#9ACD32', :forest_green=>'#228B22',
                    :lawn_green=>'#7CFC00', :lime_green=>'#32CD32', :sea_green=>'#2E8B57',
                    :dark_sea_green=>'#8FBC8F', :light_sea_green=>'#20B2AA', :medium_sea_green=>'#3CB371',
                    :spring_green=>'#00FF7F', :medium_spring_green=>'#00FA9A', :web_green=>'#008000',
                    :honeydew=>'#F0FFF0', :indian_red=>'#CD5C5C', :indigo=>'#4B0082', :ivory=>'#FFFFF0',
                    :khaki=>'#F0E68C', :dark_khaki=>'#BDB76B', :lavender=>'#E6E6FA', :lavender_blush=>'#FFF0F5',
                    :lemon_chiffon=>'#FFFACD', :lime=>'#00FF00', :linen=>'#FAF0E6', :magenta=>'#FF00FF',
                    :dark_magenta=>'#8B008B', :maroon=>'#B03060', :web_maroon=>'#7F0000', :mint_cream=>'#F5FFFA',
                    :misty_rose=>'#FFE4E1', :moccasin=>'#FFE4B5', :old_lace=>'#FDF5E6', :olive=>'#808000',
                    :olive_drab=>'#6B8E23', :orange=>'#FFA500', :dark_orange=>'#FF8C00', :orchid=>'#DA70D6',
                    :dark_orchid=>'#9932CC', :medium_orchid=>'#BA55D3', :papaya_whip=>'#FFEFD5',
                    :peach_puff=>'#FFDAB9', :peru=>'#CD853F', :pink=>'#FFC0CB', :deep_pink=>'#FF1493',
                    :light_pink=>'#FFB6C1', :hot_pink=>'#FF69B4', :plum=>'#DDA0DD', :purple=>'#A020F0',
                    :medium_purple=>'#9370DB', :rebecca_purple=>'#663399', :web_purple=>'#7F007F',
                    :red=>'#FF0000', :dark_red=>'#8B0000', :orange_red=>'#FF4500', :medium_violet_red=>'#C71585',
                    :pale_violet_red=>'#DB7093', :salmon=>'#FA8072', :dark_salmon=>'#E9967A', :light_salmon=>'#FFA07A',
                    :seashell=>'#FFF5EE', :sienna=>'#A0522D', :silver=>'#C0C0C0', :dark_slate_gray=>'#2F4F4F',
                    :snow=>'#FFFAFA', :tan=>'#D2B48C', :teal=>'#008080', :thistle=>'#D8BFD8', :tomato=>'#FF6347',
                    :turquoise=>'#40E0D0', :dark_turquoise=>'#00CED1', :medium_turquoise=>'#48D1CC',
                    :pale_turquoise=>'#AFEEEE', :violet=>'#EE82EE', :dark_violet=>'#9400D3', :blue_violet=>'#8A2BE2',
                    :wheat=>'#F5DEB3', :white=>'#FFFFFF', :antique_white=>'#FAEBD7', :floral_white=>'#FFFAF0',
                    :ghost_white=>'#F8F8FF', :navajo_white=>'#FFDEAD', :white_smoke=>'#F5F5F5', :yellow=>'#FFFF00',
                    :light_yellow=>'#FFFFE0', :green_yellow=>'#ADFF2F'}
    end
    module_function :color_table
  end
end
