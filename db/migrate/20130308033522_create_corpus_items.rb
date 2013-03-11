class CreateCorpusItems < ActiveRecord::Migration
  def change
    create_table :corpus_items do |t|
      t.string :title
      t.integer :year
      t.string :corpus_name
      t.integer :document_id
      t.timestamps
    end
  end
end
