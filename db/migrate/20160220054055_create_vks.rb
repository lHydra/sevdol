class CreateVks < ActiveRecord::Migration
  def change
    create_table :vks do |t|
      t.string :login
      t.string :password

      t.timestamps null: false
    end
  end
end
