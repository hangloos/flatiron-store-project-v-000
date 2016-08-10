Carts Model:
user_id:integer

has_many line_items
has_many items through line_items


Category:

has_many :items


Line_item:
cart_id:integer
item_id:integer

belongs_to :cart
belongs_to :item

quantity:integer - default 1


Item:

belongs_to category
has_many line_items

category_id:integer
title:string
price:integer (maybe some currency?)


User: 

email:string
password:string


use devise gem

has_many :carts


**current_cart method uses the session