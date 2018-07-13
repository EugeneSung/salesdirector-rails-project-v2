class Customer < ApplicationRecord
  belongs_to :user


  def contact(user)
    Contact.find_by(:user_id=>user.id)
  end
end
