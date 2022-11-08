class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :title, uniqueness: true

      t.timestamps
    end
  end
end
