class Category < ActiveRecord::Base
    has_many :errands
    has_many :users, through: :errands
end