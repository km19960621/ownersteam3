class Order < ApplicationRecord
  belongs_to :user, optional: true

  validates :pitcher_card_id, presence: true
  validates :catcher_card_id, presence: true
  validates :first_card_id, presence: true
  validates :second_card_id, presence: true
  validates :third_card_id, presence: true
  validates :short_card_id, presence: true
  validates :left_card_id, presence: true
  validates :center_card_id, presence: true
  validates :right_card_id, presence: true
end
