class CreateBirthdays < ActiveRecord::Migration[6.0]
  def change
    create_table :birthdays do |t|
      t.date   :birthday,           null: false
      t.references :user
      t.timestamps
    end
  end
end
