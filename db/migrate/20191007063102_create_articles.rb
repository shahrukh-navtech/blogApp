class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      #t.string :auth
      t.text :body
      t.string :url

      t.timestamps
    end
  end
end
