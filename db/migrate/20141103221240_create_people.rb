class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :dude

      t.timestamps
    end
  end
end
