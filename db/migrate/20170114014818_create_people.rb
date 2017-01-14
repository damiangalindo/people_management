class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name, null: false, limit: 75, index: true
      t.string :last_name, null: false, limit: 75, index: true
      t.string :email, null: false, limit: 254, unique: :true
      t.string :job, limit: 75, index: true
      t.text :bio
      t.integer :gender, index: true
      t.date :birthdate, null: false, index: true
      t.string :picture

      t.timestamps null: false
    end
  end
end
