ActiveAdmin.register Banner do
	permit_params :title, :duration, :author_name

	form do |f|
	    f.inputs 'Banner Information' do
	      f.input :title
	      f.input :duration
	      f.input :author_name
	    end
	    f.actions
	end
	index do
	    selectable_column
	    id_column
	    column :title
	    column :duration
	    column :author_name

	    actions
	end
end