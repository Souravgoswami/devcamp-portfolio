class CreateEducation2s < ActiveRecord::Migration[6.0]
  def change
    create_table :education2s do |t|
      t.text :body
      t.string :title

      t.timestamps
    end
  end
end
