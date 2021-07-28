# frozen_string_literal: true

ActiveAdmin.register Breed do
  config.create_another = true
  menu priority: 5

  permit_params :name, :image, :history, :allergy_informations, :physical_attributes, :personality

  includes image_attachment: :blob

  form do |f|
    f.semantic_errors
    tabs do
      tab 'Basic' do
        f.inputs 'Basic Details' do
          f.input :name, placeholder: 'name'
          f.input :personality, placeholder: 'personality'
          f.input :history, placeholder: 'history'
          f.input :allergy_informations, placeholder: 'allergy_informations'
          f.input :physical_attributes, placeholder: 'physical_attributes'
          f.input :image, as: :file
        end
      end
    end
    f.actions
  end

  show do |_t|
    attributes_table do
      row :name
      row :history
      row :personality
      row :allergy_informations
      row :physical_attributes
      row :image do |ad|
        image_tag rails_blob_path(ad.image, only_path: true), size: '50%'
      end
    end
  end
end
