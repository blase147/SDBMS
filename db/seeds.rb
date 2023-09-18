# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Seed the database with staff members, passwords, and roles
# db/seeds.rb

# Create staff members with specific attributes, passwords, and roles
staff_members = [
  {
    email: 'solarmails2@gmail.com',
    password: '123456',
    photo: File.open(Rails.root.join('app', 'assets', 'images', 'main_photo.jpg')), 
    title: 'Mr',
    firstname: 'John',
    lastname: 'Doe',
    phone: '123-456-7890',
    dateofbirth: Date.new(1980, 1, 15),
    country: 'USA',
    state: 'California',
    lga: 'Los Angeles',
    street: '123 Main Street',
    department: 'IT Department',
    salary: 60000.00,
    hire_date: Date.new(2021, 5, 10),
    designation: 'Software Engineer',
    roles: [:administrator]
  },
  # Add more staff members as needed
]

staff_members.each do |staff_info|
  staff = Staff.find_or_initialize_by(email: staff_info[:email])
  staff.password = staff_info[:password] unless staff.encrypted_password.present?
  staff.photo = staff_info[:photo]

  # Clear existing roles and assign new roles
  staff.roles = staff_info[:roles].map { |role_name| Role.find_or_create_by(name: role_name) }

  # Set other attributes
  staff.photo.attach(io: File.open(staff_info[:photo]), filename: 'main_photo.jpg') if staff_info[:photo]
  staff.title = staff_info[:title]
  staff.firstname = staff_info[:firstname]
  staff.lastname = staff_info[:lastname]
  staff.phone = staff_info[:phone]
  staff.dateofbirth = staff_info[:dateofbirth]
  staff.country = staff_info[:country]
  staff.state = staff_info[:state]
  staff.lga = staff_info[:lga]
  staff.street = staff_info[:street]
  staff.department = staff_info[:department]
  staff.salary = staff_info[:salary]
  staff.hire_date = staff_info[:hire_date]
  staff.designation = staff_info[:designation]

  staff.save
end


