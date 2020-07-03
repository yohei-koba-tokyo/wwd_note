class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :note, foreign_key: true
      t.string     :comment, null: false 
      t.timestamps
    end
  end
end
