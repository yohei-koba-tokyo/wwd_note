class Feeling < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :note_feelings
  has_many :notes, through: :note_feelings
end
