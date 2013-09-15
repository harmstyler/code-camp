class CreateSpeakerSubmissions < ActiveRecord::Migration
  def change
    create_table :speaker_submissions do |t|
      t.string :name
      t.string :email
      t.string :title
      t.text :abstract
      t.text :speaker_bio

      t.timestamps
    end
  end
end
