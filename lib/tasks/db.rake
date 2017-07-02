namespace :db do
  desc "TODO"
  task line_item_price_to_0: :environment do
    LineItem.all.each do |item|
      item.price = 0
      item.save!
    end
  end

end
