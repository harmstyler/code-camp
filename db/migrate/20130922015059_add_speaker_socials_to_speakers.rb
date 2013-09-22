class AddSpeakerSocialsToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :twitter, :string
    add_column :speakers, :company, :string
    add_column :speakers, :company_url, :string
    add_column :speakers, :personal_site, :string
  end
end
