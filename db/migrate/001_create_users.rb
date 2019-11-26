class CreateUsers < ActiveRecord::Migration[5.2]
    def change
        create_table :users do |t|
            t.string :user_name
            t.string :password
            t.string :first_name
            t.string :last_name
        end
    end
end