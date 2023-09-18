# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create staff members with specific email addresses and assign roles
staff_members = [
  { email: 'solarmails2@gmail.com', roles: [:administrator] },
  { email: 'solarmails3@gmail.com', roles: [:teacher] },
  { email: 'solarmails4@gmail.com', roles: [:accountant] },
  { email: 'solarmails5@gmail.com', roles: [:human_resource] }
]

staff_members.each do |staff_info|
  staff = Staff.find_or_create_by(email: staff_info[:email])
  
  staff_info[:roles].each do |role_name|
    role = Role.find_or_create_by(name: role_name)
    staff.add_role(role)
  end
end