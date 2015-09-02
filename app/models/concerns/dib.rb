class Dib < ActiveRecord::Base
  belongs_to :dibber
  validates :dibber_id, presence: true
  validates :name, presence: true, length: {minimum: 5, maximum:100}
  validates :note, presence: true, length: {minimum: 10, maximum: 150}
  mount_uploader :picture, PictureUploader
  validate :picture_size
  default_scope -> {order(updated_at: :desc)}

  private
  def picture_size
    if picture.size > 5.megabytes
      error.add(:picture, "should be less than 5MB")
    end
  end
end
