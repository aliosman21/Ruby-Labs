class ArticleSerializer < ActiveModel::Serializer

  attributes :id
  has_many :comments , embed: :objects
end
