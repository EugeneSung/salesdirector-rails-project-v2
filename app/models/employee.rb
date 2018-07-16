class Employee < ApplicationRecord
  belongs_to :user
  has_many :orders

  def contact(user)
    Contact.find_by(:user_id=>user.id)
  end
  def name
    Contact.find_by_user_id(self.user_id).name
  end
end
