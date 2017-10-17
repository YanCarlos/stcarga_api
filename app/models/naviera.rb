class Naviera < ApplicationRecord
  has_many :containers, dependent: :destroy
end
