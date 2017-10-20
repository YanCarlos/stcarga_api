class Container < ApplicationRecord
  belongs_to :user
  before_validation :validate_model

  def validate_model
    # Si el codigo es vacio
    raise CustomError, 'Ingrese el codigo del contenedor.' if self.codigo.nil?
  end

  def self.filtrar params
    if params[:codigo].present?
      self.where(
        "lower(codigo) like '%#{params[:codigo].downcase}%'"
      )
    end
  end
end
