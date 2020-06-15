class Note < ApplicationRecord
  belongs_to :user
  belongs_to :memo
  has_many :note_feelings
  has_many :feelings, through: :note_feelings
end
