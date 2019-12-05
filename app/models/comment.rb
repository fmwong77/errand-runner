class Comment < ActiveRecord::Base
    belongs_to :errand
    has_many :replies, :dependent => :destroy

    validates :content, presence: true
    validates_numericality_of :rating, :only_integer => true, :allow_nil => false, 
    :greater_than_or_equal_to => 0,
    :less_than_or_equal_to => 5
end