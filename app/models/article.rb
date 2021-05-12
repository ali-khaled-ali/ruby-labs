class Article < ApplicationRecord
    include ActiveModel::SerializerSupport
    #include ActiveModel::ArraySerializerSupport
    
   

    belongs_to :user
    has_many :comments, dependent: :destroy
    validates :title, presence: true,
                      length: { minimum: 5 }

    

  end