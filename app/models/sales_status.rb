class SalesStatus < ActiveHash::Base
  self.data = [
    { id: 1, sales_status: '---' },
    { id: 2, sales_status: '良品' },
    { id: 3, sales_status: '比較的良品' },
    { id: 4, sales_status: '形不揃い' },
    { id: 5, sales_status: '訳あり品' },
  ]
  include ActiveHash::Associations
  belongs_to :item
end