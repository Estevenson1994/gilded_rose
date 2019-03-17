module Normal_item

  def update_normal_item(item)
    remove_one_from_quality(item) if quality_is_greater_than_0(item)
    remove_one_from_quality(item) if item_has_expired(item) && quality_is_greater_than_0(item)
    remove_one_day_from_sell_in(item)
  end

private

  def remove_one_from_quality(item)
    item.quality -= 1
  end

  def quality_is_greater_than_0(item)
    item.quality > 0
  end

  def item_has_expired(item)
    item.sell_in <= 0
  end

end