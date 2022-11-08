class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.text :description
      t.string :email, uniqueness: true
      t.belongs_to :city, index: true

      t.timestamps
    end
  end
end
