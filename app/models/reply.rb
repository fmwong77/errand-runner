class Reply < ActiveRecord::Base
    belongs_to :comment

    validates :content, presence: true

end