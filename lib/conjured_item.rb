module ConjuredItem

  def update_conjured_item(item)
    remove_two_from_quality(item) if quality_is_greater_than_0(item)
    remove_two_from_quality(item) if quality_is_greater_than_0(item) && item_has_expired(item) 
    quality_is_0(item) if quality_is_less_than_0(item) 
  end

    private

  def remove_two_from_quality(item)
    item.quality -= 2
  end

  def quality_is_less_than_0(item)
    item.quality < 0
  end

  def quality_is_0(item)
    item.quality = 0
  end

  def quality_is_greater_than_0(item)
    item.quality > 0
  end

end
