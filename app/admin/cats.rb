ActiveAdmin.register Cat do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  menu priority: 1
  
  permit_params :name, :mother_id, :father_id, :status, :sex, :colour, :breed, :breeding, :litter_id, :date_of_birth,
                images: []

  includes :mother, :father, :litter, images_attachments: :blob


  form html: { multipart: true } do |f|
    f.inputs do
      f.semantic_errors
      f.inputs
      f.input :images, as: :file, input_html: { multiple: true }
      f.actions
    end
  end

end
