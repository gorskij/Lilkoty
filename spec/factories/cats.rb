# frozen_string_literal: true

FactoryBot.define do
  factory :cat do
    name { 'cat_name' }
    breed_id { create(:breed).id }
    sex { 'male' }
    status { 'unavailable' }
    date_of_birth { '2018-02-03' }
    breeding { 'breeding_name' }
  end
end
