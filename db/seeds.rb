# For FnF old version.
# User.create({:email => "lugatex@yahoo.com", :name => "Oleg G.Kapranov", :password => "12345678", :password_confirmation => "12345678", :confirmed_at => Time.now })
# User.create({:email => "zhuk_andriy@hotmail.com", :name => "Andrey Zhuk", :password => "qwerty", :password_confirmation => "qwerty", :confirmed_at => Time.now })
# User.create({:email => "test@example.com", :name => "Test", :password => "qwerty", :password_confirmation => "qwerty", :confirmed_at => Time.now })
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email
# User.update_all(:confirmed_at => Time.now)

# Product.delete_all
# Product.create! id: 1, name: "Banana", price: 0.49, active: true
# Product.create! id: 2, name: "Apple", price: 0.29, active: true
# Product.create! id: 3, name: "Carton of Strawberries", price: 1.99, active: true

# OrderStatus.delete_all
# OrderStatus.create! id: 1, name: "In Progress"
# OrderStatus.create! id: 2, name: "Placed"
# OrderStatus.create! id: 3, name: "Shipped"
# OrderStatus.create! id: 4, name: "Cancelled"

# For new FnF version.
# User.create(email: "lugatex@yahoo.com", name: "Oleg G.Kapranov", password: "12345678", password_confirmation: "12345678" )
# User.create(email: "zhuk_andriy@hotmail.com", name: "Andrey Zhuk", password: "qwerty", password_confirmation: "qwerty" )
# User.create(email: "test@example.com", name: "Test", password: "qwerty", password_confirmation: "qwerty" )

# Create Order status
OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"
