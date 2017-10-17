class Container < ApplicationRecord
  belongs_to :naviera
  
  before_validation :validate_model

  def validate_model
    # Si el codigo es vacio
    raise CustomError, 'Ingrese el codigo del contenedor.' if self.codigo.nil?
    # Si la fecha de entrega es vacia
    raise CustomError, 'Seleccione la fecha en la que entró el contenedor' if self.fecha_entrega.nil?
    # Si la fecha limite de devolion es vacia
    raise CustomError, 'Selecciona la fecha en la que debe entregarse el contenedor' if self.fecha_limite_devolucion.nil?
    # Si la fecha limite de devolucion es < a la fecha de entrega
    raise CustomError, 'La fecha limite de entrega no puede ser antes de la fecha de entrada del contenedor.' if self.fecha_limite_devolucion < self.fecha_entrega
    #Si la fecha de devolucion es < a la fecha de entrega
    raise CustomError, 'La fecha de entrega no puede ser antes de la fecha de entrada del contenedor.' if self.fecha_devolucion.present? and self.fecha_devolucion < self.fecha_entrega
    # Si la naviera esta vacia
    raise CustomError, 'Por favor elija la naviera del contenedor.' if self.naviera_id.nil?
  end
end
