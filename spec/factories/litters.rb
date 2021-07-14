# frozen_string_literal: true

FactoryBot.define do
  factory :litter do
    name { 'litter_name' }
    date_of_creation { '2018-02-03' }
    mother_id { create(:cat).id }
    father_id { create(:cat).id }
  end
end
