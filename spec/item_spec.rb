require 'spec_helper'

describe GildedRose do
  before(:each) do
    @items = [Other.new("foo", 0, 0),
              Other.new("+5 Dexterity Vest", 10, 20),
              AgedBrie.new("Aged Brie", 2, 0),
              Other.new("Aged Brie", 50, 50),
              Other.new("Elixir of the Mongoose", 5, 7),
              Sulfuras.new("Sulfuras, Hand of Ragnaros", 0, 80),
              Sulfuras.new("Sulfuras, Hand of Ragnaros", -1, 80),
              Backstage.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
              Backstage.new("Backstage passes to a TAFKAL80ETC concert", 10, 49),
              Backstage.new("Backstage passes to a TAFKAL80ETC concert", 5, 49)]
    GildedRose.new(@items).update_quality()
  end

  describe "#update_quality" do
    it "item = foo" do
      expect(@items[0].name).to eq "foo"
      expect(@items[0].sell_in).to eq -1
      expect(@items[0].quality).to eq 0
    end

    it "item = +5 Dexterity Vest" do
      expect(@items[1].name).to eq "+5 Dexterity Vest"
      expect(@items[1].sell_in).to eq 9
      expect(@items[1].quality).to eq 19
    end

    it "item = Aged Brie (1)" do
      expect(@items[2].name).to eq "Aged Brie"
      expect(@items[2].sell_in).to eq 1
      expect(@items[2].quality).to eq 1
    end

    it "item = Aged Brie (2)" do
      expect(@items[3].name).to eq "Aged Brie"
      expect(@items[3].sell_in).to eq 49
      expect(@items[3].quality).to eq 50
    end

    it "item = Elixir of the Mongoose" do
      expect(@items[4].name).to eq "Elixir of the Mongoose"
      expect(@items[4].sell_in).to eq 4
      expect(@items[4].quality).to eq 6
    end

    it "item = Sulfuras, Hand of Ragnaros (1)" do
      expect(@items[5].name).to eq "Sulfuras, Hand of Ragnaros"
      expect(@items[5].sell_in).to eq 0
      expect(@items[5].quality).to eq 80
    end

    it "item = Sulfuras, Hand of Ragnaros (2)" do
      expect(@items[6].name).to eq "Sulfuras, Hand of Ragnaros"
      expect(@items[6].sell_in).to eq -1
      expect(@items[6].quality).to eq 80
    end

    it "item = Backstage passes to a TAFKAL80ETC concert (1)" do
      expect(@items[7].name).to eq "Backstage passes to a TAFKAL80ETC concert"
      expect(@items[7].sell_in).to eq 14
      expect(@items[7].quality).to eq 21
    end

    it "item = Backstage passes to a TAFKAL80ETC concert (2)" do
      expect(@items[8].name).to eq "Backstage passes to a TAFKAL80ETC concert"
      expect(@items[8].sell_in).to eq 9
      expect(@items[8].quality).to eq 50
    end

    it "item = Backstage passes to a TAFKAL80ETC concert (3)" do
      expect(@items[9].name).to eq "Backstage passes to a TAFKAL80ETC concert"
      expect(@items[9].sell_in).to eq 4
      expect(@items[9].quality).to eq 50
    end

  end


end
