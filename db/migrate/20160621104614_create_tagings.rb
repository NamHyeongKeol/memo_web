class CreateTagings < ActiveRecord::Migration
  def change
    create_table :tagings do |t|

      t.timestamps null: false

      t.references :memo
      t.references :label
    end
  end
end
