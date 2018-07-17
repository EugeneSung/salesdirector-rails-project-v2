class User < ApplicationRecord
  has_many :employees
  has_many :customers
  has_many :contacts


 has_secure_password
 validates :username, :password, presence: true
 validates :username, uniqueness: true

 accepts_nested_attributes_for :contacts, update_only: true

 def user_number?
   if self.admin
    "EMP#{'%06d' % self.id}"
  else
    "CUS#{'%06d' % self.id}"
  end

 end

 def contact(user)
   Contact.find_by(:user_id=>user.id)
 end
end
