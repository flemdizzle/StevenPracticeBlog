module PostsHelper

    def social(int, symbol, **options)
      mask = options.fetch(:mask, nil)
      if int.to_s.length == 9
         if mask
            
         else
          string = int.to_s
          return string[0..2] + symbol + string[3..4] + symbol + string[5..8]
         end
      else
          return "please give a valid social"
      end
    end

end
