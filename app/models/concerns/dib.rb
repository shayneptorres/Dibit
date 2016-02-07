class Dib < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  belongs_to :dibber
  validates :dibber_id, presence: true
  validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum:100}
  mount_uploader :picture, PictureUploader
  validate :picture_size
  # default_scope -> {order(updated_at: :desc)}

  private
  def picture_size
    if picture.size > 5.megabytes
      error.add(:picture, "should be less than 5MB")
    end
  end
end
