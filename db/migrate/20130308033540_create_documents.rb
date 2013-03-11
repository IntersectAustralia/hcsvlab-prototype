class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :media_type
      t.integer :corpus_item_id
      t.timestamps
    end
  end
end
