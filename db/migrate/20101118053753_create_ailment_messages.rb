class CreateAilmentMessages < ActiveRecord::Migration
  def self.up
    create_table :ailment_messages do |t|
      t.string :message
      t.string :location
      t.integer :patient_id

      t.timestamps
    end
  end

  def self.down
    drop_table :ailment_messages
  end
end
