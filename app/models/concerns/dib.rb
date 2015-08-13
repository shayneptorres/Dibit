class Dib < ActiveRecord::Base
  belongs_to :dibber
  validates :dibber_id, presence: true
  validates :name, presence: true, length: {minimum: 5, maximum:100}
  validates :note, presence: true, length: {minimum: 10, maximum: 150}
end
