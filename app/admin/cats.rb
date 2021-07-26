# frozen_string_literal: true

ActiveAdmin.register Cat do
  config.create_another = true
  menu priority: 1

  permit_params :name, :mother_id, :father_id, :status, :sex, :colour, :breed_id, :breeding, :litter_id, :date_of_birth,
                :lineage_url

  includes :mother, :father, :litter, :breed

  form do |f|
    if f.object.new_record?
      f.object.status = 'available'
      f.object.date_of_birth = Date.today
      f.object.sex = 'male'
      f.object.breeding = 'Lilkoty'
      f.object.mother = Cat.where(sex: 'female').first
      f.object.father = Cat.where(sex: 'male').first
      f.object.litter = Litter.first
      f.object.breed = Breed.first
    end
    tabs do
      tab 'Basic' do
        f.inputs 'Basic Details' do
          f.input :name, placeholder: 'name'
          f.input :status, as: :select, collection: %w[available not-available reserved new-home]
          f.input :sex, as: :select, collection: %w[male female]
          f.input :date_of_birth
          f.input :breed, collection: Breed.all
          f.input :colour, placeholder: 'colour'
          f.input :breeding
          f.input :lineage_url, placeholder: 'link to lineage pdf', label: 'Lineage pdf link'
        end
      end

      tab 'Family', html_options: { class: 'specific_css_class' } do
        f.inputs 'Family Details' do
          f.input :mother, as: :select, collection: Cat.where(sex: 'female')
          f.input :father, as: :select, collection: Cat.where(sex: 'male')
          f.input :litter
        end
      end
      f.semantic_errors
      f.actions
    end
  end
end
