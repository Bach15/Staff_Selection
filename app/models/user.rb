class User < ApplicationRecord
  
  before_save {self.email = email.downcase}

  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, length: { maximum: 255}, 
                   format: { with: VALID_EMAIL_REGEX},
                   uniqueness: true


  def full_name
    self.id.to_s+ "-" + self.name 
  end

end
