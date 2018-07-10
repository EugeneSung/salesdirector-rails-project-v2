class User < ApplicationRecord
  has_many :employees
  has_many :customers
  has_many :contacts


 has_secure_password
 validates :user_name, :password, presence: true
 validates :name_name, uniqueness: true

 accepts_nested_attributes_for :contacts, :allow_destroy => true

end
