class List < ApplicationRecord
  belongs_to :user
  has_many   :items,   dependent: :destroy
  validates  :user_id, presence: true
  validates  :name,    length: { in: 1..50 }
end
