class User < ApplicationRecord
  has_many :employees
  has_many :customers
  has_many :contacts


 has_secure_password
 validates :username, :password, presence: true
 validates :username, uniqueness: true

 accepts_nested_attributes_for :contacts, :allow_destroy => true

 def emp_id
   "EMP#{'%06d' % self.id}"
 end
 def cus_id
   "CUS#{'%06d' % self.id}"
 end
end
