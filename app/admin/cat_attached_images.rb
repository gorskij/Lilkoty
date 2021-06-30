# frozen_string_literal: true

ActiveAdmin.register CatAttachedImage do
  menu priority: 5

  permit_params :cat_id, :date, :image, :role

  includes image_attachment: :blob

  form html: { multipart: true } do |f|
    f.semantic_errors
    f.inputs
    f.input :image, as: :file
    f.actions
  end
end
