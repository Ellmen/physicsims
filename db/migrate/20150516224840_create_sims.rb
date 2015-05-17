class CreateSims < ActiveRecord::Migration
  def change
    create_table :sims do |t|
      t.string :image
      t.string :name
      t.string :link
      t.string :description
      t.timestamps
    end
  end
end
