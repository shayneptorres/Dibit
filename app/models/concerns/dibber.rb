class Dibber < ActiveRecord::Base
  has_many :dibs
  #this saves all the email in the database as downcase
  before_save {self.email = self.email.downcase }
  validates :name, presence: true, length: {minimum: 3, maximum: 40}
  #here is the email verification
  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 105},
                                    uniqueness: {case_sensitive: false},
                                    format: {with: VALID_EMAIL_REGEX}

has_secure_password

end
