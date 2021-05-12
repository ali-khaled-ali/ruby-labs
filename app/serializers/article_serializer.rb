class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :user
  has_many :comments
  
end
