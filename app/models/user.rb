class User < ActiveRecord::Base
  attr_accessor :new_password, :new_password_confirmation

  attr_encrypted :password,
    key:  "b621d5685b2dfefbb4ab0bb45f4d5a300cd2bc45a2201313da06240e4015bfa049173ea7e147cce0267d9bf73c4f2c858cf7e49b8535ebdb0d2cf93b84e2d107",
    mode: :per_attribute_iv_and_salt

  validates :name,  presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, confirmation: true, presence: true
  validates :password_confirmation, presence: true

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user && user.password == password
      user
    else
      nil
    end
  end
end
