module Aged_brie


  def aged_brie(item)
    item.sell_in > 0 ? item.quality += 1 : item.quality += 2
    item.quality = 50 if item.quality > 50
    item.sell_in -= 1
  end


end