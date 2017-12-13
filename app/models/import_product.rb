class ImportProduct < ApplicationRecord
  belongs_to :import

  before_save do 
    self.total_unidades = self.paquetes * self.unidad_por_paquete
    self.total_paquete = self.paquetes
    self.peso_bruto = self.peso_neto * self.paquetes
  end
  
end
