class AddPriceValueToLineItemsFromProducts < ActiveRecord::Migration
  def change
    LineItem.all.each do |item|
      item.price = Product.find(item.product_id).price
      item.save!
    end
  end
end
