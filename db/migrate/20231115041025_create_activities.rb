class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :details
      t.string :type
      t.integer :user_id
    end
  end
end
