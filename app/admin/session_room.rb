ActiveAdmin.register SessionRoom do
  controller do
    def permitted_params
      params.permit(:session_room => [:name])
    end
  end
end
