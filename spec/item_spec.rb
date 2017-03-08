require 'spec_helper'

describe Item do

  describe "#initialize" do
    it "is an Item" do
      new_item = Item.new("item_name","item_sell_in","item_quality")
      expect(new_item).to be_an_instance_of Item
    end
  end

end
