ActiveAdmin.register Session do
  form do |f|
    f.inputs "Session Details" do
      f.input :title
      f.input :abstract
      f.input :speaker
      f.input :session_time
      f.input :session_room, :as => :radio
    end
    f.actions
  end
  controller do
    def permitted_params
      params.permit(:session => [:speaker_id, :title, :abstract, :session_time_id, :session_room_id])
    end
  end
end
