class CreateErrands < ActiveRecord::Migration[5.2]
    def change
        create_table :errands do |t|
            t.integer :category_id
            t.integer :user_id
            t.integer :runner_user_id
            t.string :description
            t.datetime :due_date
        end
    end
end