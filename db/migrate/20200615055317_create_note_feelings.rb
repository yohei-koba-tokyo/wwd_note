class CreateNoteFeelings < ActiveRecord::Migration[5.2]
  def change
    create_table :note_feelings do |t|
      t.references :note, foreign_key: true
      t.references :feeling, foreign_key: true
      t.timestamps
    end
  end
end
