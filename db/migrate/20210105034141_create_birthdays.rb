class CreateBirthdays < ActiveRecord::Migration[6.0]
  def change
    create_table :birthdays do |t|

      t.timestamps
    end
  end
end
