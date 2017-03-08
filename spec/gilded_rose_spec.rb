require 'spec_helper'

describe GildedRose do

  describe "#initialize" do
    it "takes three parameters and should be an Item" do
      new_item = Item.new("item_name","item_sell_in","item_quality")
      expect(new_item).to be_an_instance_of Item
    end
  end

  describe "#update_quality" do
    context "Sulfuras" do
      it "does" do

      end
    end

    context "Aged Brie" do
      it "does" do

      end
    end

  end

end
