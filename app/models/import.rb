class Import < ApplicationRecord
  has_many :import_products, dependent: :destroy
  has_many :dispatchs, dependent: :destroy
end
