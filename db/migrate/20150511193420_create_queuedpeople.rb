class CreateQueuedpeople < ActiveRecord::Migration
  def change
    create_table :queuedpeople do |t|
      t.string :firstname
      t.string :lastname
      t.datetime :lasttexttime
      t.boolean :removed

      t.timestamps null: false
    end
  end
end
