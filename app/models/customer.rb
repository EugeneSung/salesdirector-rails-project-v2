class Customer < ApplicationRecord
  belongs_to :user
  has_many :orders


  def self.find_by_user_id(user_id)
    self.all.detect {|s| user_id == s.user_id}
  end
  def contact(user)
    Contact.find_by(:user_id=>user.id)
  end
  def name
    Contact.find_by_user_id(self.user_id).name
  end

end
