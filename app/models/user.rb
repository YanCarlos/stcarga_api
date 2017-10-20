class User < ApplicationRecord
  rolify
  has_secure_password
  has_many :containers, dependent: :destroy
  validates :password, presence: true, length: { minimum: 6 }, :on => :create


  def role
    self.roles[0].name
  end

  def be_admin
    self.add_role :admin
  end

  def be_customer
    self.add_role :customer
  end

  def be_employee
    self.add_role :employee
  end

  def reset_token
    self.update_attribute(:token, nil)
  end

  def generate_token   
    self.update_attribute(:token, generate_string)
  end

  def generate_string(length=35)
    chars = 'abcde_fghjkmnpqrs_tuvwxyzABCDEFGHJK_LMNPQRSTUVWXYZ0123456789_'
    string = ''
    length.times { string << chars[rand(chars.size)] }
    string
  end
end
