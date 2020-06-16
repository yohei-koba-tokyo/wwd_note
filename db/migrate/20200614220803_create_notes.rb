class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.references :user, foreign_key: true
      t.references :memo, foreign_key: true
      t.string :what
      t.string :why
      t.integer :feeling
      t.string :feeling_detail
      t.string :challenge
      t.timestamps
    end
  end
end
