ActiveAdmin.register Subscriber do
  controller do
    def permitted_params
      params.permit(:subscriber => [:name, :email])
    end
  end
end
