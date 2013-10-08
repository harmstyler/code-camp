ActiveAdmin.register Sponsor do
  index do
    column :name
    column :level
    column :link
    default_actions
  end
  form do |f|
    f.inputs "Code Camp Sponsors" do
      f.input :name
      f.input :logo
      f.input :level, :as => :select, :collection => ['Gold', 'Silver', 'Bronze']
      f.input :description
      f.input :link
    end
    f.actions
  end
  controller do
    def permitted_params
      params.permit(:sponsor => [:name, :logo, :level, :description, :link])
    end
  end
end
