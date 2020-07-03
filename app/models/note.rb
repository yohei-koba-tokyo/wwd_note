class Note < ApplicationRecord
  belongs_to :user
  belongs_to :memo
  has_many :note_feelings, dependent: :destroy
  has_many :feelings, through: :note_feelings
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
