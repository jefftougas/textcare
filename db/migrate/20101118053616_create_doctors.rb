class CreateDoctors < ActiveRecord::Migration
  def self.up
    create_table :doctors do |t|
      t.string :tn
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :doctors
  end
end
