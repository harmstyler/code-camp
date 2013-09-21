ActiveAdmin.register Speaker do
  form do |f|
    f.inputs "Speaker Details" do
      f.input :firstname
      f.input :lastname
      f.input :email, :as => :email
      f.input :display, :label => "Display Speaker"
      f.input :slug
    end
    f.actions
  end
  controller do
    def permitted_params
      params.permit(:speaker => [:firstname, :lastname, :email, :display, :slug])
    end
  end
end
