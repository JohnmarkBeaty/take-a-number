class Addphonenumbertopersion < ActiveRecord::Migration
  def change
    add_column :queuedpeople , :phonenumber, :string

  end
end
