class Comment < ActiveRecord::Base
    belongs_to :errand
    has_many :replies

    validates :content, presence: true
    validates :rating, numericality: { only_integer: true }
end