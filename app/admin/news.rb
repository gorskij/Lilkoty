# frozen_string_literal: true

ActiveAdmin.register News do
  config.create_another = true
  menu priority: 6

  permit_params :title, :image, :content, :video_url, :date

  includes image_attachment: :blob

  form do |f|
    f.object.date = Time.zone.today if f.object.new_record?
    f.semantic_errors
    tabs do
      tab 'Basic' do
        f.inputs 'Basic Details' do
          f.input :title, placeholder: 'title'
          f.input :content, placeholder: 'content'
          f.input :video_url, placeholder: 'video_url'
          f.input :date
          f.input :image, as: :file
        end
      end
    end
    f.actions
  end

  show do |_t|
    attributes_table do
      row :title
      row :content
      row :video_url
      row :date
      row :image do |ad|
        image_tag rails_blob_path(ad.image, only_path: true), size: '50%'
      end
    end
  end
end
