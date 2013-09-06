ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Info" do
          para "Welcome to the Codecamp Admin. Navigate models and edit content using the top menu navigation."
          para "Note that Speakers will only display on the site if the 'Diplay Speaker' checkbox is checked. Likewise, Sessions will only display if they have a speaker set to 'Display'."
        end
      end
    end # row
    columns do
      column do
        panel "Recently Created Sessions" do
          table_for Session.order('created_at desc').limit(10) do
            column("State")   {|session| status_tag(session.state)}
            column("Title")   {|session| link_to(session.title, admin_session_path(session))}
            column("Speaker"){|session| link_to(session.speaker, admin_speaker_path(session.speaker)) }
          end
        end
      end
      column do
        panel "Recently Created Speakers" do
          table_for Speaker.order('created_at desc').limit(10) do
            column("State")   {|speaker| status_tag(speaker.state)}
            column("Name")   {|speaker| link_to(speaker, admin_speaker_path(speaker))}
            column("Email"){|speaker| link_to(speaker.email, admin_speaker_path(speaker)) }
          end
        end
      end
    end # row
    # Recently Modified Content
    #
    # columns do
    #   column do
    #     panel "Recently Modified Sessions" do
    #       table_for Session.order('updated_at desc').limit(10) do
    #         column("State")   {|session| status_tag(session.state)}
    #         column("Title")   {|session| link_to(session.title, admin_session_path(session))}
    #         column("Speaker"){|session| link_to(session.speaker, admin_speaker_path(session.speaker)) }
    #       end
    #     end
    #   end
    #   column do
    #     panel "Recently Modified Speakers" do
    #       table_for Speaker.order('updated_at desc').limit(10) do
    #         column("State")   {|speaker| status_tag(speaker.state)}
    #         column("Name")   {|speaker| link_to(speaker, admin_speaker_path(speaker))}
    #         column("Email"){|speaker| link_to(speaker.email, admin_speaker_path(speaker)) }
    #       end
    #     end
    #   end
    # end # row
  end # content
end
