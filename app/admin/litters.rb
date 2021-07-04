# frozen_string_literal: true

ActiveAdmin.register Litter do
  menu priority: 2
  permit_params :name, :mother_id, :father_id, :date_of_creation
  includes :mother, :father

  form do |f|
    if f.object.new_record? 
      f.object.mother = Cat.where(sex: 'female').first
      f.object.father = Cat.where(sex: 'male').first
      f.object.date_of_creation = Date.today
    end
    tabs do
      tab 'Basic' do
        f.inputs 'Basic Details' do
          f.input :name, placeholder: 'name'
          f.input :mother, as: :select, collection: Cat.where(sex: 'female')
          f.input :father, as: :select, collection: Cat.where(sex: 'male')
          f.input :date_of_creation
        end
      end
    end
    f.semantic_errors
    f.actions
  end
end
