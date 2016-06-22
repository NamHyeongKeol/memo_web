class CreateMemos < ActiveRecord::Migration
  def change
    create_table :memos do |t|

      t.timestamps null: false

      t.string :title, null: false, default: ""
      t.text :content, null: false, default: ""
    end
  end
end
