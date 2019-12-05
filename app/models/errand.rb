class Errand < ActiveRecord::Base
    belongs_to :user
    belongs_to :category
    has_one :comment
    has_many :replies, through: :comments

    validates :description, presence: true
    validates :due_date, presence: true
    validates :category_id, presence: true
end