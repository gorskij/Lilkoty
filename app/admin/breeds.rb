# frozen_string_literal: true

ActiveAdmin.register Breed do
  config.create_another = true
  menu priority: 5

  permit_params :name, :image, :history, :allergy_informations, :physical_attributes

  includes image_attachment: :blob

  form do |f|
    if f.object.new_record?
      f.object.name = 'name'
      f.object.history = 'history'
      f.object.allergy_informations = 'allergy_informations'
      f.object.physical_attributes = 'physical_attributes'
    end
    f.semantic_errors
    tabs do
      tab 'Basic' do
        f.inputs 'Basic Details' do
          f.input :name
          f.input :history
          f.input :allergy_informations
          f.input :physical_attributes
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
      row :allergy_informations
      row :physical_attributes
      row :image do |ad|
        image_tag rails_blob_path(ad.image, only_path: true), size: '50%'
      end
    end
  end
end
