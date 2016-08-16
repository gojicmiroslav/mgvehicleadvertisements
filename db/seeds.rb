# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Advertisement.destroy_all
Style.destroy_all
Transmission.destroy_all
Fuel.destroy_all
Drive.destroy_all
Style.destroy_all
Color.destroy_all
Engine.destroy_all
AirCondition.destroy_all
VehicleModel.destroy_all
Category.destroy_all
VehicleBrand.destroy_all
Option.destroy_all
User.destroy_all
AdvertisementType.destroy_all


# Users
User.create!(	firstname: "Miroslav",
							lastname: "Gojic",
							email: "miroslavy2k@gmail.com",
							password: "deronje777",
							password_confirmation: "deronje777",
							confirmed_at: Time.zone.now )

User.create!(	firstname: "Pera",
							lastname: "Peric",
							email: "pera@gmail.com",
							password: "deronje777",
							password_confirmation: "deronje777",
							confirmed_at: Time.zone.now )

User.create!(	firstname: "Maja",
							lastname: "Mudrinic",
							email: "maja@gmail.com",
							password: "deronje777",
							password_confirmation: "deronje777",
							confirmed_at: Time.zone.now )

Category.create!(name: "Cars", 
								 description: "Contrary to popular belief, Lorem Ipsum is not simply random text. 
								 							It has roots in a piece of classical Latin literature from 45 BC, making it 
								 							over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney 
								 							College in Virginia, looked up one of the more obscure Latin words, 
								 							consectetur, from a Lorem Ipsum passage, and going through the cites of the 
								 							word in classical literature, discovered the undoubtable source. 
								 							Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of 
								 							de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, 
								 							written in 45 BC. This book is a treatise on the theory of ethics, 
								 							very popular during the Renaissance. The first line of Lorem Ipsum, 
								 							Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.")

Category.create!(name: "Bicycles", 
								 description: "Contrary to popular belief, Lorem Ipsum is not simply random text. 
								 							It has roots in a piece of classical Latin literature from 45 BC, making it 
								 							over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney 
								 							College in Virginia, looked up one of the more obscure Latin words, 
								 							consectetur, from a Lorem Ipsum passage, and going through the cites of the 
								 							word in classical literature, discovered the undoubtable source. 
								 							Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of 
								 							de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, 
								 							written in 45 BC. This book is a treatise on the theory of ethics, 
								 							very popular during the Renaissance. The first line of Lorem Ipsum, 
								 							Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.")

Category.create!(name: "Trucks", 
								 description: "Contrary to popular belief, Lorem Ipsum is not simply random text. 
								 							It has roots in a piece of classical Latin literature from 45 BC, making it 
								 							over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney 
								 							College in Virginia, looked up one of the more obscure Latin words, 
								 							consectetur, from a Lorem Ipsum passage, and going through the cites of the 
								 							word in classical literature, discovered the undoubtable source. 
								 							Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of 
								 							de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, 
								 							written in 45 BC. This book is a treatise on the theory of ethics, 
								 							very popular during the Renaissance. The first line of Lorem Ipsum, 
								 							Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.")


# CARS
vb = VehicleBrand.new(name: "AC")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Acura")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Alfa Romeo")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Alpina")
vb.categories << Category.find_by(name: "Cars")
vb.save


vb = VehicleBrand.create!(name: "Opel")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Volkswagen")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Aro")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Asia Motors")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Aston Martin")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Audi")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Austin")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Autobianchi")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Bentley")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "BMW")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Brilliance")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Bugatti")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Buick")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Cadillack")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Chery")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Chevrolet")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Chrysler")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Citroen")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Corvette")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Dacia")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Daewoo")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Daihatsu")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Dodge")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "DR")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Ferrari")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Fiat")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Ford")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Honda")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Hyundai")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Isuzu")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Jaguar")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Kia")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Lada")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Lamborghini")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Lancia")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Mazda")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Mercedes Benz")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Mitsubishi")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Moszkvics")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Nissan")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Peugeot")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Porsche")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Renault")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Suzuki")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Skoda")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Toyota")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Wartburg")
vb.categories << Category.find_by(name: "Cars")
vb.save

vb = VehicleBrand.create!(name: "Zastava")
vb.categories << Category.find_by(name: "Cars")
vb.save


#Bicycles
vb = VehicleBrand.create!(name: "Access Motor")
vb.categories << Category.find_by(name: "Bicycles")
vb.save

vb = VehicleBrand.create!(name: "Adly")
vb.categories << Category.find_by(name: "Bicycles")
vb.save

vb = VehicleBrand.create!(name: "Aeon")
vb.categories << Category.find_by(name: "Bicycles")
vb.save

vb = VehicleBrand.create!(name: "AJS")
vb.categories << Category.find_by(name: "Bicycles")
vb.save

vb = VehicleBrand.find_by(name: "BMW")
vb.categories << Category.find_by(name: "Bicycles")
vb.save

vb = VehicleBrand.find_by(name: "Renault")
vb.categories << Category.find_by(name: "Bicycles")
vb.save


# TRUCKS
vb = VehicleBrand.create!(name: "FAP")
vb.categories << Category.find_by(name: "Trucks")
vb.save

vb = VehicleBrand.create!(name: "MAN")
vb.categories << Category.find_by(name: "Trucks")
vb.save

vb = VehicleBrand.create!(name: "Iveco")
vb.categories << Category.find_by(name: "Trucks")
vb.save

vb = VehicleBrand.create!(name: "TAM")
vb.categories << Category.find_by(name: "Trucks")
vb.save

vb = VehicleBrand.find_by(name: "Mercedes Benz")
vb.categories << Category.find_by(name: "Trucks")
vb.save

vb = VehicleBrand.find_by(name: "Ford")
vb.categories << Category.find_by(name: "Trucks")
vb.save

vb = VehicleBrand.find_by(name: "Fiat")
vb.categories << Category.find_by(name: "Trucks")
vb.save

vb = VehicleBrand.find_by(name: "Opel")
vb.categories << Category.find_by(name: "Trucks")
vb.save

# VEHICLE MODEL
vm = VehicleModel.new(name: "Astra G")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Opel")
vm.save

vm = VehicleModel.new(name: "Astra F")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Opel")
vm.save

vm = VehicleModel.new(name: "Ascona")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Opel")
vm.save

vm = VehicleModel.new(name: "Astra J")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Opel")
vm.save

vm = VehicleModel.new(name: "Corsa A")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Opel")
vm.save

vm = VehicleModel.new(name: "Corsa B")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Opel")
vm.save

vm = VehicleModel.new(name: "Corsa C")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Opel")
vm.save

vm = VehicleModel.new(name: "Corsa D")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Opel")
vm.save

vm = VehicleModel.new(name: "Calibra")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Opel")
vm.save

vm = VehicleModel.new(name: "Insignia")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Opel")
vm.save

vm = VehicleModel.new(name: "Omega")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Opel")
vm.save

vm = VehicleModel.new(name: "A 140")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "A 150")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "A 160")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "A 170")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "A 180")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "A 190")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "A 200")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "A 210")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "A 220")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "A 230")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "A 240")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "A 250")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "B 150")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "B 160")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "B 170")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "B 180")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "B 190")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "B 200")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "C 180")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "C 200")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "C 220")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "C 230")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "C 240")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "Laguna")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Renault")
vm.save

vm = VehicleModel.new(name: "Kangoo")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Renault")
vm.save

vm = VehicleModel.new(name: "Scenic")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Renault")
vm.save

vm = VehicleModel.new(name: "Spider")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Renault")
vm.save

vm = VehicleModel.new(name: "Twingo")
vm.category = Category.find_by(name: "Cars")
vm.vehicle_brand = VehicleBrand.find_by(name: "Renault")
vm.save

# VehicleModel - Trucks
vm = VehicleModel.new(name: "T1")
vm.category = Category.find_by(name: "Trucks")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "T2")
vm.category = Category.find_by(name: "Trucks")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "T3")
vm.category = Category.find_by(name: "Trucks")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "T4")
vm.category = Category.find_by(name: "Trucks")
vm.vehicle_brand = VehicleBrand.find_by(name: "Mercedes Benz")
vm.save

vm = VehicleModel.new(name: "F1")
vm.category = Category.find_by(name: "Trucks")
vm.vehicle_brand = VehicleBrand.find_by(name: "FAP")
vm.save

vm = VehicleModel.new(name: "F2")
vm.category = Category.find_by(name: "Trucks")
vm.vehicle_brand = VehicleBrand.find_by(name: "FAP")
vm.save

vm = VehicleModel.new(name: "F3")
vm.category = Category.find_by(name: "Trucks")
vm.vehicle_brand = VehicleBrand.find_by(name: "FAP")
vm.save

vm = VehicleModel.new(name: "F4")
vm.category = Category.find_by(name: "Trucks")
vm.vehicle_brand = VehicleBrand.find_by(name: "FAP")
vm.save

vm = VehicleModel.new(name: "Byc 1")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand = VehicleBrand.find_by(name: "Access Motor")
vm.save

vm = VehicleModel.new(name: "Byc 2")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand = VehicleBrand.find_by(name: "Access Motor")
vm.save

vm = VehicleModel.new(name: "Byc 3")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand = VehicleBrand.find_by(name: "Access Motor")
vm.save

vm = VehicleModel.new(name: "Byc 4")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand = VehicleBrand.find_by(name: "Access Motor")
vm.save

vm = VehicleModel.new(name: "Byc 5")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand = VehicleBrand.find_by(name: "Access Motor")
vm.save

vm = VehicleModel.new(name: "Renault Byc 1")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand = VehicleBrand.find_by(name: "Renault")
vm.save

vm = VehicleModel.new(name: "Renault Byc 2")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand = VehicleBrand.find_by(name: "Renault")
vm.save

vm = VehicleModel.new(name: "Renault Byc 3")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand = VehicleBrand.find_by(name: "Renault")
vm.save

vm = VehicleModel.new(name: "Renault Byc 4")
vm.category = Category.find_by(name: "Bicycles")
vm.vehicle_brand  VehicleBrand.find_by(name: "Renault")
vm.save

# ADVERTISEMENT TYPE
AdvertisementType.create!(name: "New")
AdvertisementType.create!(name: "Used")

# OPTIONS

# STYLES
Style.create!(name: "AWD/4WD")
Style.create!(name: "Commercial")
Style.create!(name: "Convertible")
Style.create!(name: "Coupe")
Style.create!(name: "Hatchback")
Style.create!(name: "Hybrid/Electric")
Style.create!(name: "Luxury")
Style.create!(name: "Sedan")
Style.create!(name: "SUV/Crossover")
Style.create!(name: "Truck")
Style.create!(name: "Van/Minivan")
Style.create!(name: "Wagon")

Fuel.create!(name: "Gasoline")
Fuel.create!(name: "Diesel")
Fuel.create!(name: "Gasoline + Gas(TNG)")
Fuel.create!(name: "Hybrid")
Fuel.create!(name: "Electric")
Fuel.create!(name: "Alternate")

Transmission.create!(name: "Automatic")
Transmission.create!(name: "Manual")
Transmission.create!(name: "Semi-automatic")
Transmission.create!(name: "CVT")
Transmission.create!(name: "Other")

Drive.create!(name: "FWD")
Drive.create!(name: "RWD")
Drive.create!(name: "AWD")
Drive.create!(name: "4WD")
Drive.create!(name: "4x4")
Drive.create!(name: "4x2")
Drive.create!(name: "Other")

Engine.create!(name: "3 cylinder")
Engine.create!(name: "4 cylinder")
Engine.create!(name: "5 cylinder")
Engine.create!(name: "6 cylinder")
Engine.create!(name: "8 cylinder")
Engine.create!(name: "10 cylinder")
Engine.create!(name: "12 cylinder")
Engine.create!(name: "Electric")
Engine.create!(name: "Hybrid")
Engine.create!(name: "Rotary Engine")

Color.create!(name: "Beige")
Color.create!(name: "Blue")
Color.create!(name: "Black")
Color.create!(name: "Burgundy")
Color.create!(name: "Charcoal")
Color.create!(name: "Gold")
Color.create!(name: "Gray")
Color.create!(name: "Green")
Color.create!(name: "Off White")
Color.create!(name: "Orange")
Color.create!(name: "Pink")
Color.create!(name: "Beige")
Color.create!(name: "Purple")
Color.create!(name: "Red")
Color.create!(name: "Silver")
Color.create!(name: "Tan")
Color.create!(name: "Turquoise")
Color.create!(name: "White")
Color.create!(name: "Yellow")

AirCondition.create!(name: "Automatic")
AirCondition.create!(name: "Manual")
AirCondition.create!(name: "None")

#Option.create!(name: "Price")
#Option.create!(name: "Year")
#Option.create!(name: "Mileage")
#Option.create!(name: "Capacity(cm3)")
#Option.create!(name: "Power(kW)")
Option.create!(name: "3rd Row Seats")
Option.create!(name: "Backup Camera")
Option.create!(name: "Cruise Control")
Option.create!(name: "Keyless Entry")
Option.create!(name: "Power Locks")
Option.create!(name: "Power Windows")
Option.create!(name: "Steering Wheel Controls")
Option.create!(name: "Bluetooth(Hands-Free)")
Option.create!(name: "CD Player")
Option.create!(name: "DVD Player")
Option.create!(name: "Navigation")
Option.create!(name: "Portable Audio Connection")
Option.create!(name: "Premium Audio")
Option.create!(name: "Security System")
Option.create!(name: "Heated Seats")
Option.create!(name: "Leather Seats")
Option.create!(name: "Premium Wheels")
Option.create!(name: "Sunroof")
Option.create!(name: "Disability Equipped")
Option.create!(name: "Lift Kit")
Option.create!(name: "Trailer Hitch")
Option.create!(name: "Back Break")
Option.create!(name: "Hands Break") 
Option.create!(name: "Lights") 

# CategoryOption
c = Category.find_by(name: "Cars")
o = Option.find_by(name: "3rd Row Seats")
c.options <<  o
o = Option.find_by(name: "Backup Camera")
c.options <<  o
o = Option.find_by(name: "Cruise Control")
c.options <<  o
o = Option.find_by(name: "Keyless Entry")
c.options <<  o
o = Option.find_by(name: "Power Locks")
c.options <<  o
o = Option.find_by(name: "Power Windows")
c.options <<  o
o = Option.find_by(name: "Steering Wheel Controls")
c.options <<  o
o = Option.find_by(name: "Bluetooth(Hands-Free)")
c.options <<  o
o = Option.find_by(name: "CD Player")
c.options <<  o
o = Option.find_by(name: "DVD Player")
c.options <<  o
o = Option.find_by(name: "Navigation")
c.options <<  o
o = Option.find_by(name: "Portable Audio Connection")
c.options <<  o
o = Option.find_by(name: "Premium Audio")
c.options <<  o
o = Option.find_by(name: "Security System")
c.options <<  o
o = Option.find_by(name: "Heated Seats")
c.options <<  o
o = Option.find_by(name: "Leather Seats")
c.options <<  o
o = Option.find_by(name: "Sunroof")
c.options <<  o
o = Option.find_by(name: "Premium Wheels")
c.options <<  o
o = Option.find_by(name: "Disability Equipped")
c.options <<  o
o = Option.find_by(name: "Lift Kit")
c.options <<  o
o = Option.find_by(name: "Trailer Hitch")
c.options <<  o
c.save

c = Category.find_by(name: "Trucks")
o = Option.find_by(name: "Backup Camera")
c.options <<  o
o = Option.find_by(name: "Cruise Control")
c.options <<  o
o = Option.find_by(name: "Keyless Entry")
c.options <<  o
o = Option.find_by(name: "Power Locks")
c.options <<  o
o = Option.find_by(name: "Power Windows")
c.options <<  o
o = Option.find_by(name: "Steering Wheel Controls")
c.options <<  o
o = Option.find_by(name: "Bluetooth(Hands-Free)")
c.options <<  o
o = Option.find_by(name: "CD Player")
c.options <<  o
o = Option.find_by(name: "DVD Player")
c.options <<  o
o = Option.find_by(name: "Navigation")
c.options <<  o
o = Option.find_by(name: "Portable Audio Connection")
c.options <<  o
o = Option.find_by(name: "Premium Audio")
c.options <<  o
o = Option.find_by(name: "Security System")
c.options <<  o
o = Option.find_by(name: "Heated Seats")
c.options <<  o
o = Option.find_by(name: "Leather Seats")
c.options <<  o
o = Option.find_by(name: "Sunroof")
c.options <<  o
o = Option.find_by(name: "Premium Wheels")
c.options <<  o
o = Option.find_by(name: "Disability Equipped")
c.options <<  o
o = Option.find_by(name: "Lift Kit")
c.options <<  o
o = Option.find_by(name: "Trailer Hitch")
c.options <<  o
c.save

c = Category.find_by(name: "Bicycles")
o = Option.find_by(name: "Navigation")
c.options <<  o
o = Option.find_by(name: "Security System")
c.options <<  o
o = Option.find_by(name: "Heated Seats")
c.options <<  o
o = Option.find_by(name: "Leather Seats")
c.options <<  o
o = Option.find_by(name: "Premium Wheels")
c.options <<  o
o = Option.find_by(name: "Lights")
c.options <<  o
o = Option.find_by(name: "Back Break")
c.options <<  o
o = Option.find_by(name: "Hands Break")
c.options <<  o
c.save

ad1 = Advertisement.create!(title: "2010 BMW 530 D GT", description: "", price: 25.999, year: DateTime.strptime("09/14/2009", "%m/%d/%Y"),
											capacity: 2000, power: 2500, mileage: 192.333, created_at: Time.zone.now, updated_at: Time.zone.now,
											fuel: Fuel.first, style: Style.first, air_condition: AirCondition.first, exterior_color: Color.first,
											interior_color: Color.first, engine: Engine.first, drive: Drive.first, transmission: Transmission.first,
											category: Category.first, vehicle_model: VehicleModel.first, user: User.first, advertisement_type: AdvertisementType.first)

# Options
ad1.options << Option.find_by(name: "3rd Row Seats")
ad1.options << Option.find_by(name: "Backup Camera")
ad1.options << Option.find_by(name: "Power Locks")
ad1.options << Option.find_by(name: "Bluetooth(Hands-Free)")
ad1.options << Option.find_by(name: "CD Player")
ad1.options << Option.find_by(name: "DVD Player")
ad1.options << Option.find_by(name: "Navigation")
ad1.options << Option.find_by(name: "Premium Audio")
ad1.options << Option.find_by(name: "Security System")
ad1.options << Option.find_by(name: "Trailer Hitch")
ad1.save



ad2 = Advertisement.create!(title: "2010 BMW X1 2.0 Navi/xDrive", description: "Some description", price: 14.000, year: DateTime.strptime("01/01/2000", "%m/%d/%Y"),
											capacity: 1800, power: 2000, mileage: 200.000, created_at: Time.zone.now, updated_at: Time.zone.now,
											fuel: Fuel.first, style: Style.first, air_condition: AirCondition.first, exterior_color: Color.first,
											interior_color: Color.first, engine: Engine.first, drive: Drive.first, transmission: Transmission.first,
											category: Category.first, vehicle_model: VehicleModel.first, user: User.first, advertisement_type: AdvertisementType.first)

# Options
ad2.options << Option.find_by(name: "3rd Row Seats")
ad2.options << Option.find_by(name: "Backup Camera")
ad2.options << Option.find_by(name: "Power Locks")
ad2.options << Option.find_by(name: "Bluetooth(Hands-Free)")
ad2.options << Option.find_by(name: "CD Player")
ad2.options << Option.find_by(name: "DVD Player")
ad2.options << Option.find_by(name: "Navigation")
ad2.options << Option.find_by(name: "Premium Audio")
ad2.options << Option.find_by(name: "Security System")
ad2.options << Option.find_by(name: "Trailer Hitch")
ad2.options << Option.find_by(name: "Power Windows")
ad2.options << Option.find_by(name: "Lift Kit")
ad2.options << Option.find_by(name: "Sunroof")
ad2.options << Option.find_by(name: "Leather Seats")
ad2.options << Option.find_by(name: "Heated Seats")
ad2.options << Option.find_by(name: "Portable Audio Connection")
ad2.options << Option.find_by(name: "Steering Wheel Controls")
ad2.save

