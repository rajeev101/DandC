ActiveAdmin.register Contact do
  
  permit_params :address, :open_time, :email, :phone_number

  form do |f|
    f.inputs 'Contact Information' do
      f.input :address
      f.input :open_time
      f.input :email
      f.input :phone_number
    end
    f.actions
  end


  index do
    selectable_column
    id_column
    column :email
    column :phone_number
    column :open_time
    column :address

    actions
  end

end
