class Category < ActiveHash::Base
  self.data = [
    { id: 1, category: '---' },
    { id: 2, category: '野菜' },
    { id: 3, category: '果実' },
    { id: 4, category: '米、穀類' },
    { id: 5, category: 'お茶' },
    { id: 6, category: '花' },
    { id: 7, category: 'その他' }
  ]
  include ActiveHash::Associations
  belongs_to :item
end
