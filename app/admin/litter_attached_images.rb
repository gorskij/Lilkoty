# frozen_string_literal: true

ActiveAdmin.register LitterAttachedImage do
  config.create_another = true
  menu priority: 4

  permit_params :litter_id, :image

  includes image_attachment: :blob

  form do |f|
    f.object.litter = Litter.first if f.object.new_record?
    f.semantic_errors
    tabs do
      tab 'Basic' do
        f.inputs 'Basic Details' do
          f.input :litter
          f.input :image, as: :file
        end
      end
    end
    f.actions
  end

  show do |_t|
    attributes_table do
      row :litter
      row :image do |ad|
        image_tag rails_blob_path(ad.image, only_path: true), size: '50%'
      end
    end
  end
end
