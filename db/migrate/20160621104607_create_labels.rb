class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|

      t.timestamps null: false

      t.string :name, null: false, default: ""
    end
  end
end
