class User < ActiveRecord::Base
    has_many :errands
    has_many :categories, through: :errands
end