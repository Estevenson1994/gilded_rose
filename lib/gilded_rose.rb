require_relative 'aged_brie'
require_relative 'backstage_passes'
require_relative 'normal_item'
require_relative 'conjured_item'

class GildedRose

  include Aged_brie, Backstage_passes, Normal_item, Conjured_item

  def initialize(items)
    @items = items
  end

  def update_quality

    @items.each do |item|
      if item.name == "Aged Brie"
        update_aged_brie(item)
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        update_backstage_passes(item)
      elsif item.name.match(/(?i)conjured/)
        update_conjured_item(item)
      elsif item.name != "Sulfuras, Hand of Ragnaros"
        update_normal_item(item)
      end
    end
  end

  private

  def remove_one_day_from_sell_in(item)
    item.sell_in -= 1
  end

  def dont_let_quality_go_above_50(item)
    item.quality = 50 if item.quality > 50
  end

  def item_has_expired(item)
    item.sell_in <= 0
  end
  

end
