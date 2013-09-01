ActiveAdmin.register Session do
  controller do
    def permitted_params
      params.permit(:session => [:speaker_id, :title, :abstract, :session_time_id, :session_room_id])
    end
  end
end
