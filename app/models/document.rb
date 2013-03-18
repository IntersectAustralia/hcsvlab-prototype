class Document < ActiveRecord::Base
  belongs_to :corpus_item


  attr_accessible :media_type, :url

  searchable do
    #keyword search (full text)
    text :corpus_name do
      corpus_item.corpus_name
    end
    text :title do
      corpus_item.title
    end
    text :year do
      corpus_item.year
    end
    text :media_type

    #scoped search (for everything else)
    string :corpus_name do
      corpus_item.corpus_name
    end
    string :sub_corpus_name do
      corpus_item.sub_corpus_name
    end
    string :title do
      corpus_item.title
    end
    integer :year do
      corpus_item.year
    end
    string :media_type
  end
end