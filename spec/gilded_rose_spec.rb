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

    it 'decreases quality by one each day' do
      items = [Item.new("item", 1, 1)]
      gilded_rose = GildedRose.new(items)
      expect { gilded_rose.update_quality }.to change { items[0].quality}.by(-1)
    end

    it 'never lowers quality below 0' do
      items = [Item.new("item", 1, 0)]
      gilded_rose = GildedRose.new(items)
      expect { gilded_rose.update_quality }.to change { items[0].quality}.by(0)
    end

  end



end
