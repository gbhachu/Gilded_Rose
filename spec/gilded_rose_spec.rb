require 'spec_helper'

describe GildedRose do

  describe "#update_quality" do

    it "does not change the name" do
      items = [Item.new("Pocket Watch", 10, 30)]
      GildedRose.new(items).update_quality()
      expect( items[0].name ).to eq( "Pocket Watch" )
    end

    it "does change the quality" do
      items = [Item.new("Pocket Watch", 10, 30)]
      expect{ GildedRose.new(items).update_quality() }.to change{ items[0].quality }
    end

    it "degrades the sell-in value by 1" do
      items = [Item.new("Pocket Watch", 10, 30)]
      expect{ GildedRose.new(items).update_quality() }.to change{ items[0].sell_in }.by( -1 )
    end

    it "degrades the quality twice as fast if sell by date has passed" do
      items = [Item.new("Pocket Watch", -2, 30)]
      GildedRose.new(items).update_quality()
      expect( items[0].quality ).to eq( 28 )
    end

    it "does not degrade the quality to less than zero" do
      items = [Item.new("Pocket Watch", -2, 30)]
      store = GildedRose.new(items)
      16.times do
        store.update_quality()
      end
      expect( items[0].quality ).not_to eq( -2 )
    end

    it "does not increase the quality to more than 50" do
      items = [Item.new("Aged Brie", 2, 48)]
      store = GildedRose.new(items)
      4.times do
        store.update_quality()
      end
      expect( items[0].quality ).not_to eq( 52 )
    end

    context "when item is 'aged brie'" do

      it "does not degrade the quality" do
        items = [Item.new("Aged Brie", 2, 6)]
        GildedRose.new(items).update_quality()
        expect( items[0].quality ).not_to be_between(0, 6).inclusive
      end

      it "does increase the quality" do
        items = [Item.new("Aged Brie", 2, 6)]
        GildedRose.new(items).update_quality()
        expect( items[0].quality ).to be > 6
      end

      it "does increase the quality by one" do
        items = [Item.new("Aged Brie", 2, 6)]
        GildedRose.new(items).update_quality()
        expect( items[0].quality ).to eq( 7 )
      end

    end

    context "when item is 'sulfuras'" do

      it "does not change the quality" do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 80)]
        GildedRose.new(items).update_quality()
        expect( items[0].quality ).to eq( 80 )
      end

      it "does not change the sell-in value" do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 80)]
        GildedRose.new(items).update_quality()
        expect( items[0].sell_in ).to eq( 0 )
      end

    end

    context "when item is 'backstage passes'" do

      it "increases the quality by 1" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)]
        GildedRose.new(items).update_quality()
        expect( items[0].quality ).to eq( 21 )
      end

      it "increases the quality by 2 when sell-in value is 10 or less" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 20)]
        GildedRose.new(items).update_quality()
        expect( items[0].quality ).to eq( 22 )
      end

      it "increases the quality by 3 when sell-in value is 5 or less" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 20)]
        GildedRose.new(items).update_quality()
        expect( items[0].quality ).to eq( 23 )
      end

      it "decreases the quality to 0 when sell-in value is 0 or less" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 20)]
        GildedRose.new(items).update_quality()
        expect( items[0].quality ).to eq( 0 )
      end

    end

    context "when item is 'conjured'" do

      it "degrades in quality twice as fast as normal items" do
        items = [
          Item.new("Conjured Mana Cake", 10, 30),
          Item.new("Conjured Mana Cake",  0, 30)
        ]
        expect{ GildedRose.new(items).update_quality() }.to change{ items[0].quality }.by( -2 )
        expect{ GildedRose.new(items).update_quality() }.to change{ items[1].quality }.by( -4 )
      end

    end

  end

end
