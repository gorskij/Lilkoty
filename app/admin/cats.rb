ActiveAdmin.register Cat do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :mother_id, :father_id, :status, :sex, :colour, :breed, :breeding, :litter_id, :date_of_birth,
                images: []
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :mother_id, :father_id, :status, :sex, :colour, :breed, :breeding, :litter_id, :date_of_birth]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form html: { multipart: true } do |f|
    f.inputs do
      f.semantic_errors
      f.inputs
      f.input :images, as: :file, input_html: { multiple: true }
      f.actions
    end
  end

end
