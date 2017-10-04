class User < ApplicationRecord
	has_secure_password
  validates :password, presence: true, length: { minimum: 6 }


  def reset_token
  	self.update_attribute(:token, nil)
  end

  def generate_token(length=35)
    chars = 'abcde_fghjkmnpqrs_tuvwxyzABCDEFGHJK_LMNPQRSTUVWXYZ0123456789_'
    token = ''
    length.times { token << chars[rand(chars.size)] }
    self.update_attribute(:token, token)
  end
end
