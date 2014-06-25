namespace :db do
  task :populate => :environment do
    require 'populator'
    require 'faker'
    

    #Client.populate 100 do |c|
    #  c.name    = Faker::Name.name
    #  c.lastname = Faker::Name.last_name
    #  c.cuit   = Faker::Number.number(11)
    #  c.address  = Faker::Address.street_address
    #end

    #Article.populate 100 do |a|
    #  a.bar_code = Faker::Number.number(12)
    #  a.description  = Faker::Commerce.product_name
    #  a.price = 0..1999
    #  a.price_cost   = 0..1999
    #  a.price_card  = 0..1999
    #  a.category_id = 1..3
    #end

    #Supplier.populate 100 do |s|
    #  s.name    = Faker::Name.name
    #end

    
  end
end