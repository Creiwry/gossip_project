class CreateTagOfGossips < ActiveRecord::Migration[7.0]
  def change
    create_table :tag_of_gossips do |t|

      t.timestamps
    end
  end
end
