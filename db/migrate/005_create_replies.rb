class CreateReplies < ActiveRecord::Migration[5.2]
    def change
        create_table :replies do |t|
            t.integer :comment_id
            # t.integer :user_id
            t.string :content
        end
    end
end