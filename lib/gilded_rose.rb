require_relative 'aged_brie'
require_relative 'backstage_passes'
require_relative 'normal_item'

class GildedRose

  include Aged_brie, Backstage_passes, Normal_item

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
        if item.sell_in > 0 && item.quality > 0
          item.quality -= 2
        elsif item.quality < 0
          item.quality = 0
        end
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


end
#   def update_quality
#     @items.each do |item|
#       if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
#         if item.quality > 0
#           if item.name != "Sulfuras, Hand of Ragnaros"
#             item.quality = item.quality - 1
#           end
#         end
#       else
#         if item.quality < 50
#           item.quality = item.quality + 1
#           if item.name == "Backstage passes to a TAFKAL80ETC concert"
#             if item.sell_in < 11
#               if item.quality < 50
#                 item.quality = item.quality + 1
#               end
#             end
#             if item.sell_in < 6
#               if item.quality < 50
#                 item.quality = item.quality + 1
#               end
#             end
#           end
#         end
#       end
#       if item.name != "Sulfuras, Hand of Ragnaros"
#         item.sell_in = item.sell_in - 1
#       end
#       if item.sell_in < 0
#         if item.name != "Aged Brie"
#           if item.name != "Backstage passes to a TAFKAL80ETC concert"
#             if item.quality > 0
#               if item.name != "Sulfuras, Hand of Ragnaros"
#                 item.quality = item.quality - 1
#               end
#             end
#           else
#             item.quality = item.quality - item.quality
#           end
#         else
#           if item.quality < 50
#             item.quality = item.quality + 1
#           end
#         end
#       end
#     end
#   end
# end
