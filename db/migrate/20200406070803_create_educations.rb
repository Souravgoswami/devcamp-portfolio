class CreateEducations < ActiveRecord::Migration[6.0]
  def change
    create_table :educations do |t|
      t.string :title
      t.text :body
      t.text :body2

      t.timestamps
    end
  end
end
