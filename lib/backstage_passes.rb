module Backstage_passes

    
  def update_backstage_passes(item)
    add_one_to_quality(item)
    add_one_to_quality(item) if less_than_11_days_to_sell(item)
    add_one_to_quality(item) if less_than_6_days_to_sell(item)
    dont_let_quality_go_above_50(item)
    set_quality_to_0_if_passed_sell_in(item)
    remove_one_day_from_sell_in(item)
  end

  private

  def set_quality_to_0_if_passed_sell_in(item)
    item.quality = 0 if item.sell_in <= 0
  end

  def add_one_to_quality(item)
    item.quality += 1
  end

  def less_than_11_days_to_sell(item)
    item.sell_in < 11
  end

  def less_than_6_days_to_sell(item)
    item.sell_in < 6
  end

end