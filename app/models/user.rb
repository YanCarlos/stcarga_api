class User < ApplicationRecord
  rolify
  has_secure_password
  has_many :containers, dependent: :destroy
  before_validation :validate_model
  after_save :after_save_event

  def validate_model
    if (self.new_record? && self.password.nil?) || self.email_de_registro_enviado == false
      self.password = generate_string(8)
      if self.persisted?
        self.save!
      end
    end

    if self.has_role? :customer
      raise CustomError, 'El nombre de este cliente es requerido.' if self.nombre.nil?
      raise CustomError, 'El nombre del representante de este cliente es requerido.' if self.nombre_contacto.nil?
      raise CustomError, 'El email del representate de este cliente es requerido.' if self.email.nil?
    end
  end


  def after_save_event
    send_email_after_activate if self.activo && self.email_de_registro_enviado == false
    reset_token if self.persisted? && self.activo == false 
  end


  def send_email_after_activate
    if self.has_role? :customer
      email_from_register_was_sent if UserMailer.customer_registered(self).deliver_now
    end  
    return self 
  end



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

  def email_from_register_was_sent
    self.update_attribute(:email_de_registro_enviado, true)
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
