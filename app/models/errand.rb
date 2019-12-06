class Errand < ActiveRecord::Base
    belongs_to :user
    belongs_to :category
    has_one :comment, :dependent => :destroy
    has_many :replies, through: :comments

    validates :description, presence: true
    validates :due_date, presence: true
    validates :category_id, presence: true
    # validate :due_date_is_valid_datetime, :due_date_is_future_datetime

    # def due_date_is_valid_datetime
    #   errors.add(:due_date, 'must be a valid datetime') if ((DateTime.parse(due_date) rescue ArgumentError) == ArgumentError)
    # end
    # def due_date_is_future_datetime
    #   if due_date.past?
    #     errors.add(:due_date, 'cannot be in the past') if ((DateTime.parse(due_date) rescue ArgumentError) == ArgumentError)
    #   end
    # end
end

