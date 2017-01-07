# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# ---
# General users
# ---


user = User.create!(
  name: "Example user"
)
Identity.create!(
  email:        "user@example.com",
  password:     "password",
  confirmed_at: Time.zone.now,
  user:         user
)


# ---
# General backend users
# ---


# Create a registered admin.
admin = Admin.create!(
  name: "Example admin"
)
Identity.create!(
  email:        "admin@example.com",
  password:     "password",
  confirmed_at: Time.zone.now,
  backend_user: admin
)


# Create a registered account_executive.
account_executive = AccountExecutive.create!(
  name: "Example account_executive"
)
Identity.create!(
  email:        "account_executive@example.com",
  password:     "password",
  confirmed_at: Time.zone.now,
  backend_user: account_executive
)


# Create a registered management_client that belongs to the account_executive.
management_client = account_executive.management_clients.create!(
  name: "Example management_client"
)
Identity.create!(
  email:        "management_client@example.com",
  password:     "password",
  confirmed_at: Time.zone.now,
  backend_user: management_client
)


# Create a registered property_client that belongs to the account_executive.
property_client = account_executive.property_clients.create!(
  name: "Example property_client"
)
Identity.create!(
  email:        "property_client@example.com",
  password:     "password",
  confirmed_at: Time.zone.now,
  backend_user: property_client
)
