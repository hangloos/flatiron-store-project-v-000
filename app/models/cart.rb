class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  has_one :order
  belongs_to :user

  
  def add_item(item_id)
    line_item = LineItem.find_by(item_id: item_id)
    if line_item
      line_item.quantity += 1
      line_item.save
      line_item
    else
      line_items.build(item_id: item_id)
    end
  end


  def inventory_adjustment
    self.line_items.each do |line_item|
      item = Item.find(line_item.item_id)
      item.inventory = item.inventory - line_item.quantity
      item.save
    end
  end


  def total
    total_price = 0
    self.line_items.each do |line_item| 
      total_price += (line_item.item.price * line_item.quantity)
    end
    total_price
  end






end
