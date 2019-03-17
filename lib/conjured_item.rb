module Conjured_item

    def update_conjured_item(item)
        if item.sell_in > 0 && item.quality > 0
          item.quality -= 2
        elsif item.quality < 0
          item.quality = 0
        end

    end

end