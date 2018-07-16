class Contact < ApplicationRecord
  belongs_to :user

  def self.find_by_user_id(user_id)
    self.all.detect {|s| user_id == s.user_id}
  end

end
