# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.create(name: 'lilka', sex: 'female', breed: 'g', status: 'bagno', breeding: 'bagno')
Cat.create(name: 'chop', sex: 'male', breed: 'g', status: 'bagno', breeding: 'bagno')
Litter.create(name: 'h',
              mother_id: Cat.where(name: 'lilka').first.id,
              father_id: Cat.where(name: 'chop').first.id)
Cat.create(name: 'maly kot', sex: 'male', status: 'bagno',
           breeding: 'bagno',
           breed: 'g',
           mother_id: Cat.where(name: 'lilka').first.id,
           father_id: Cat.where(name: 'chop').first.id,
           litter_id: Litter.first.id)

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')
end
