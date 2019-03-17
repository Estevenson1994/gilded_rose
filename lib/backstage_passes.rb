module Backstage_passes

    
  def backstage_passes(item)
    item.quality += 1
    item.quality += 1 if item.sell_in < 11
    item.quality += 1 if item.sell_in < 6
    item.quality = 50 if item.quality > 50
    item.quality = 0 if item.sell_in <= 0
    item.sell_in -= 1
  end

end