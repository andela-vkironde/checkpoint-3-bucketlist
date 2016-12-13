class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :password,
            presence: true,
            confirmation: true,
            length:{minimum: 6}
  validates :password_confirmation,
            presence: true
  validates :email,
            presence:true,
            uniqueness: true,
            format:{with: VALID_EMAIL}
  has_secure_password


  has_many :bucket_lists
end
