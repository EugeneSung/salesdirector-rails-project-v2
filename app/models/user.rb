class User < ApplicationRecord
  has_many :employees
  has_many :customers
  has_many :contacts


 has_secure_password
 validates :username, presence: true
 validates :username, uniqueness: true

 accepts_nested_attributes_for :contacts, update_only: true

 def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
       user.provider = auth.provider
       user.uid = auth.uid
       user.username = auth.info.name
       user.password = "Auth temp pass"
       user.oauth_token = auth.credentials.token
       user.oauth_expires_at = Time.at(auth.credentials.expires_at)
       user.save!
     end
   end

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
