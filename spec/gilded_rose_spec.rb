require 'gilded_rose'
require 'item'


describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it 'decreases sell_in value by one each day' do
      items = [Item.new("item", 1 , 0)]
      gilded_rose = GildedRose.new(items)
      expect { gilded_rose.update_quality }.to change { items[0].sell_in}.by(-1)
    end

    it 'never lowers quality below 0' do
      items = [Item.new("item", 1, 0)]
      gilded_rose = GildedRose.new(items)
      expect { gilded_rose.update_quality }.to change { items[0].quality}.by(0)
    end
  end

  describe "#regular item" do
    it 'decreases in quality by two after sell_in day has passed' do
      items = [Item.new("item", 0, 10)]
      gilded_rose = GildedRose.new(items)
      expect { gilded_rose.update_quality }.to change { items[0].quality}.by(-2)
    end

    it 'decreases quality by one each day' do
      items = [Item.new("item", 1, 1)]
      gilded_rose = GildedRose.new(items)
      expect { gilded_rose.update_quality }.to change { items[0].quality}.by(-1)
    end
  end

  describe '#aged brie' do
    it 'increases in quality as it gets older' do
      items = [Item.new('Aged Brie', 10, 10)]
      gilded_rose = GildedRose.new(items)
      expect { gilded_rose.update_quality }.to change { items[0].quality}.by(1)
    end

    it 'quality never goes above 50' do
      items = [Item.new('Aged Brie', 10, 50)]
      gilded_rose = GildedRose.new(items)
      expect { gilded_rose.update_quality }.to change { items[0].quality}.by(0)
    end

    it 'increases in quality by 2 after sell_in date' do
      items = [Item.new("Aged Brie", 0, 20)]
      gilded_rose = GildedRose.new(items)
      expect { gilded_rose.update_quality }.to change { items[0].quality}.by(2)
    end
  end

  describe '#Sulfuras' do
    it 'quality does not change' do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 1, 80)]
      gilded_rose = GildedRose.new(items)
      expect { gilded_rose.update_quality }.to change { items[0].quality}.by(0)
    end

    it 'sell_in does not change' do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 1, 80)]
      gilded_rose = GildedRose.new(items)
      expect { gilded_rose.update_quality }.to change { items[0].sell_in}.by(0)
    end
  end

  describe '#Backstage Passes' do
    it 'increase in quaility by 1 when there are more than 10 days left' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 20, 10 )]
      gilded_rose = GildedRose.new(items)
      expect { gilded_rose.update_quality }.to change { items[0].quality}.by(1)
    end

    it 'increase in quaility by 2 when there are 10 days left' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10 )]
      gilded_rose = GildedRose.new(items)
      expect { gilded_rose.update_quality }.to change { items[0].quality}.by(2)
    end

    it 'increase in quaility by 3 when there are 5 days left' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10 )]
      gilded_rose = GildedRose.new(items)
      expect { gilded_rose.update_quality }.to change { items[0].quality}.by(3)
    end

    it 'quality drops to 0 after the concert' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10 )]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end

    it 'quality never increases more than 50' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 2, 50 )]
      gilded_rose = GildedRose.new(items)
      expect { gilded_rose.update_quality }.to change { items[0].quality}.by(0)
    end

    it 'quality stays at 0 after the concert' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 0 )]
      gilded_rose = GildedRose.new(items)
      expect { gilded_rose.update_quality }.to change { items[0].quality}.by(0)
    end
  end
end
