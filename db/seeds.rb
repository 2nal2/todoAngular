# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "faker"

puts "Seeding Measures"
Measure.create(name: "Libra", code: "Lb", status: true)
Measure.create(name: "Kilogramo", code: "Kg", status: true)
Measure.create(name: "Lumens", code: "Lm", status: false)
Measure.create(name: "Mililitro", code: "Ml", status: true)
Measure.create(name: "Metro", code: "M", status: true)
Measure.create(name: "Litro", code: "L", status: true)

puts "Seeding ProductCategories"
100.times do |count|
  begin
    ProductCategory.create(
        name: Faker::Company.name,
        status: Faker::Boolean.boolean(0.8)
    )
  rescue StandardError => e
    puts "Error found #{e.to_s}"
  end
end

puts "Seeding products"
200.times do |count|
  begin
     x = Product.create(
        name: Faker::Food.dish,
        bar_code: Faker::Code.ean,
        description: Faker::Food.description,
        has_iva: Faker::Boolean.boolean(0.8),
        need_prescription: Faker::Boolean.boolean(0.1),
        cost: Faker::Number.decimal(2),
        stock: Faker::Number.between(1, 50),
        min_stock: Faker::Number.between(1, 50),
        status: Faker::Boolean.boolean(0.8),
        product_category_id: Faker::Number.between(1, 10),
        measure_type: Measure.find(Faker::Number.between(1, 5)),
        measure: Faker::Number.between(1, 250)
    )

    puts x.errors.messages if x.errors.size > 0
  rescue StandardError => e
    puts "Error found #{e.to_s}"
  end
end

puts "seeding Countries"
Country.create(name: "Nicaragua", status: true)
Province.create(name: "Managua", status: true, country_id: 1)
puts "seeding Employees"
Employee.create(role: "admin", first_name: "Donaldo", last_name: "Vargas", dni: "0011704970012R", status: true, phone: "77665146")
puts "seeding Users"
User.create(email: "donaldov7@gmail.com", password: "123456", employee_id: 1)