class CorpusItem < ActiveRecord::Base
  has_many :documents

  attr_accessible :year, :title, :corpus_name, :sub_corpus_name

end
