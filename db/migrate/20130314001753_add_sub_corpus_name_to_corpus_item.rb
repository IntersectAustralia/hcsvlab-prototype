class AddSubCorpusNameToCorpusItem < ActiveRecord::Migration
  def change
    add_column :corpus_items, :sub_corpus_name, :string
  end
end
