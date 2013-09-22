ActiveAdmin.register Speaker do
  form do |f|
    f.inputs "Speaker Details" do
      f.input :firstname
      f.input :lastname
      f.input :email, :as => :email
      f.input :display, :label => "Display Speaker"
      f.input :bio, :label => "Speaker Bio"
      f.input :twitter, :label => "Twitter Handle"
      f.input :company
      f.input :company_url, :label => "Company Website"
      f.input :personal_site, :label => "Speaker Website/Blog URL"
      f.input :slug
    end
    f.actions
  end
  controller do
    def permitted_params
      params.permit(:speaker => [:firstname, :lastname, :email, :display, :bio, :twitter, :company, :company_url, :personal_site, :slug])
    end
  end
end
