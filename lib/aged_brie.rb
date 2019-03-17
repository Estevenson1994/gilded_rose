module Aged_brie

  def update_aged_brie(item)
    update_quality_if_before_sell_in(item)
    dont_let_quality_go_above_50(item)
    remove_one_day_from_sell_in(item)
  end

  private

  def update_quality_if_before_sell_in(item)
    item.sell_in > 0 ? item.quality += 1 : item.quality += 2
  end

end
