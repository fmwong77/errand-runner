class Comment < ActiveRecord::Base
    belongs_to :errand
    has_many :replies
end