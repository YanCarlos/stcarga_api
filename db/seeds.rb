# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def create_admin
  a = User.new({
    nombre: 'Admin',
    cedula: '1234567890',
    telefono: Faker::Number.number(10),
    email: 'admin@stcarga.com',
    direccion: Faker::Address.street_address,
    password: '1234567890',
    password_confirmation: '1234567890',
    token: Faker::Crypto.md5,
    email_de_registro_enviado: true,
    activo: true
  })
  a.save!
  a.be_admin
end

def create_customer
  c = User.new({
    nombre: Faker::Company.name.upcase,
    cedula: Faker::Number.number(10),
    telefono: Faker::Number.number(10),
    email: Faker::Internet.email,
    direccion: Faker::Address.street_address,
    password: '1234567890',
    password_confirmation: '1234567890',
    token: Faker::Crypto.md5,
    nombre_contacto: Faker::Superhero.name.upcase,
    telefono_contacto: Faker::Number.number(10),
    email_de_registro_enviado: true,
    activo: true
  })
  c.save!
  c.be_customer
end

def create_employee
  e = User.new({
    nombre: Faker::Company.name.upcase,
    telefono: Faker::Number.number(10),
    email: Faker::Internet.email,
    password: '1234567890',
    password_confirmation: '1234567890',
    token: Faker::Crypto.md5,
    email_de_registro_enviado: true,
    activo: true
  })
  e.save!
  e.be_employee
end

def create_container
  Container.create!(
    codigo: Faker::Lorem.characters(4).upcase + ' ' + Faker::Number.number(6) + ' ' + Faker::Number.number(1) ,
    entregado: false,
    ingreso_a_bodega: Date.today,
    inicio_de_mora: Date.today,
    fecha_limite_devolucion: Date.today + (Faker::Number.number(1).to_i).week,
    user_id: User.order('RANDOM()').limit(1)[0].id
  )
end 

def create_product
  Product.create!(
    nombre: Faker::Food.dish.upcase,
    referencia: Faker::Number.number(6),
    descripcion: Faker::Lorem.sentence(6).upcase,
  )
end

def create_driver
  Driver.create!(
    nombre: Faker::Superhero.name.upcase ,
    telefono: Faker::Number.number(10),
    cedula: Faker::Number.number(10),
    placa: Faker::Lorem.characters(5).upcase,
    trailer: Faker::Lorem.characters(6).upcase
  )
end


User.delete_all
Container.delete_all
Product.delete_all
Driver.delete_all
1.times{create_admin}
3.times{create_customer}
2.times{create_employee}
10.times{create_container}
15.times{create_product}
3.times{create_driver}
