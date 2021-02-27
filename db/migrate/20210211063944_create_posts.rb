class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.boolean :checked #ブーリアン型は、要するに真偽値型
      t.timestamps
    end
  end
end
