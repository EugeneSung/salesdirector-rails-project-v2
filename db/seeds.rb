# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
sung = User.create(username: "sung", password: "12345", admin: true, user_number: "EMP000001")
sung_con = Contact.create(name: "Sung", address_1: "123 1st St.", address_2: "2B", city: "New York", zip: "11111", state: "NY", phone:"222-333-4444", user: sung)
kim = User.create(username: "kim", password: "12345", admin: true, user_number: "EMP000002")
kim_con = Contact.create(name: "Kim", address_1: "1200 112st St.", address_2: "11C", city: "New York", zip: "11111", state: "NY", phone:"222-444-5555", user: kim)

king = User.create(username: "king", password: "12345", admin: false, user_number: "CUS000001")
king_con = Contact.create(name: "King", address_1: "22 Kings St.", address_2: "2200Y", city: "New York", zip: "11111", state: "NY", phone:"222-333-4444", user: king)
jang = User.create(username: "jang", password: "12345", admin: false, user_number: "CUS000002")
jang_con = Contact.create(name: "Jang", address_1: "200 200st Ave.", address_2: "200D", city: "New York", zip: "11111", state: "NY", phone:"222-444-5555", user: jang)
tantan = User.create(username: "tantan", password: "12345", admin: false, user_number: "CUS000003")
tantan_con = Contact.create(name: "Tan Tan", address_1: "230 12nd St.", address_2: "C2", city: "New York", zip: "11111", state: "NY", phone:"222-333-4444", user: tantan)
avi = User.create(username: "avi", password: "12345", admin: false, user_number: "CUS000004")
avi_con = Contact.create(name: "Avi", address_1: "1 1st Ave.", address_2: "1200Z", city: "New York", zip: "11111", state: "NY", phone:"222-444-5555", user: avi)

customer_1 = Customer.create(user_number: "CUS000001", user: king)
customer_2 = Customer.create(user_number: "CUS000002", user: jang)
customer_3= Customer.create(user_number: "CUS000003", user: tantan)
customer_4 = Customer.create(user_number: "CUS000004", user: avi)

employee_1 = Employee.create(user_number: "EMP000001", user: sung)
employee_2 = Employee.create(user_number: "EMP000002", user: kim)


item1 = Item.create(name: "Jewel1", price: 10, desc: "Beautiful", inventory: 120, item_type: "Necklace")
item2 = Item.create(name: "Jewel2", price: 50, desc: "Expensive", inventory: 100, item_type: "Ring")
item3 = Item.create(name: "Jewel3", price: 20, desc: "Fantastic", inventory: 110, item_type: "Earring")
item4 = Item.create(name: "Jewel4", price: 1, desc: "Cheap", inventory: 120, item_type: "Necklace")
item5 = Item.create(name: "Jewel5", price: 500, desc: "Must have", inventory: 100, item_type: "Ring")
item6 = Item.create(name: "Jewel6", price: 120, desc: "Nice", inventory: 110, item_type: "Earring")



order1 = Order.create(order_num: "ORD000001", employee: employee_1, customer: customer_1, order_total: 81)
order2 = Order.create(order_num: "ORD000002" , employee: employee_2, customer: customer_3, order_total: 871)

line_item1 = LineItem.create(order: order1, item: item1, quantity: 1)
line_item2 = LineItem.create(order: order1, item: item2, quantity: 1)
line_item3 = LineItem.create(order: order1, item: item3, quantity: 1)
line_item4 = LineItem.create(order: order1, item: item4, quantity: 1)

line_item5 = LineItem.create(order: order2, item: item6, quantity: 1)
line_item6 = LineItem.create(order: order2, item: item2, quantity: 1)
line_item7 = LineItem.create(order: order2, item: item4, quantity: 1)
line_item8 = LineItem.create(order: order2, item: item5, quantity: 1)
