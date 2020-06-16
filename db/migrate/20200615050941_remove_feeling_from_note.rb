class RemoveFeelingFromNote < ActiveRecord::Migration[5.2]
  def change
    remove_column :notes, :feeling, :integer
  end
end
