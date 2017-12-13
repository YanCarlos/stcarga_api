class Import < ApplicationRecord
  has_many :import_products, dependent: :destroy
end
