class CreateFeelings < ActiveRecord::Migration[5.2]
  def change
    create_table :feelings do |t|
      t.integer :feel
      t.string :image
      t.timestamps
    end
  end
end
