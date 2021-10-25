class CreateAudioChannels < ActiveRecord::Migration[6.1]
  def change
    create_table :audio_channels do |t|
      t.integer :chNumber
      t.string :chName
      t.string :chMcastIP
      t.text :chNotes

      t.timestamps
    end
  end
end
