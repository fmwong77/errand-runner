class User < ActiveRecord::Base
    has_many :errands
    has_many :categories, through: :errands

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :password, presence: true
end