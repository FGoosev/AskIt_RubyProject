class CreateAns < ActiveRecord::Migration[6.1]
  def change
    create_table :ans do |t|
      t.text :body
      t.belongs_to :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
