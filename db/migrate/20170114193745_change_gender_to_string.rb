class ChangeGenderToString < ActiveRecord::Migration
  def up
    change_column :people, :gender, :string, null: false
  end

  def down
    change_column :people, :gender, :integer, null: true
  end
end
