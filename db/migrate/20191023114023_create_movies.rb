class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :description
      t.string :comment

      t.timestamps
    end
  end
end
