# frozen_string_literal: true

ActiveAdmin.register CatAttachedImage do
  config.create_another = true
  menu priority: 2

  permit_params :cat_id, :image

  includes image_attachment: :blob

  form do |f|
    f.object.cat = Cat.first if f.object.new_record?
    f.semantic_errors
    tabs do
      tab 'Basic' do
        f.inputs 'Basic Details' do
          f.input :cat
          f.input :image, as: :file
        end
      end
    end
    f.actions
  end

  show do |_t|
    attributes_table do
      row :cat
      row :image do |ad|
        image_tag rails_blob_path(ad.image, only_path: true), size: '50%'
      end
    end
  end
end
