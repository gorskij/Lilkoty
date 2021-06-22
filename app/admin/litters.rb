ActiveAdmin.register Litter do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  menu priority: 2
  permit_params :name, :mother_id, :father_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :mother_id, :father_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
