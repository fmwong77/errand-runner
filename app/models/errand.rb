class Errand < ActiveRecord::Base
    belongs_to :user
    belongs_to :category
    has_one :comment
    has_many :replies, through: :comments
end