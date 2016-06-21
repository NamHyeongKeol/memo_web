class CreateTagings < ActiveRecord::Migration
  def change
    create_table :tagings do |t|

      t.timestamps null: false
    end
  end
end
