ActiveAdmin.register SessionTime do
  controller do
    def permitted_params
      params.permit(:session_time => [:time])
    end
  end
end
