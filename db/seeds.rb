# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def create_admin
  u = User.new({
    nombre: 'Admin',
    cedula: '1234567890',
    telefono: Faker::Number.number(10),
    email: 'admin@stcarga.com',
    direccion: Faker::Address.street_address,
    password: '1234567890',
    token: Faker::Crypto.md5,
    activo: true
  })
  u.save!
  u.be_admin
end

def create_naviera
  Naviera.create!(
    nombre: Faker::Company.name,
    telefono: Faker::Number.number(10),
    nota: Faker::Lorem.sentence(3)
  )
end

def create_container
  Container.create!(
    codigo: Faker::Number.number(10),
    entregado: false,
    fecha_entrega: Date.today,
    fecha_limite_devolucion: Date.today + (Faker::Number.number(1).to_i).week,
    naviera_id: Naviera.order('RANDOM()').limit(1)[0].id
  )
end 

def create_product
  Product.create!(
    nombre: Faker::Food.dish,
    referencia: Faker::Number.number(6),
    descripcion: Faker::Lorem.sentence(6),
  )
end


User.delete_all
Naviera.delete_all
Container.delete_all
Product.delete_all
1.times{create_admin}
5.times{create_naviera}
10.times{create_container}
15.times{create_product}
