# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

item =CorpusItem.new(:sub_corpus_name => "koorang", :title => "Koorang Item 1", :year => 1999, :corpus_name => "AUSNC")
item.save!
d = Document.new(:media_type => "text", :url => "http://localhost:3000/#")
d.corpus_item = item
d.save!

item =CorpusItem.new(:sub_corpus_name => "koorang",:title => "Koorang Item 2", :year => 2001, :corpus_name => "AUSNC")
item.save!
d = Document.new(:media_type => "image", :url => "http://localhost:3000/#")
d.corpus_item = item
d.save!

item =CorpusItem.new(:sub_corpus_name => "koorang",:title => "Koorang Item 3", :year => 2001, :corpus_name => "AUSNC")
item.save!
d = Document.new(:media_type => "image", :url => "http://localhost:3000/#")
d.corpus_item = item
d.save!

item =CorpusItem.new(:sub_corpus_name => "koorang",:title => "Koorang Item 4", :year => 2006, :corpus_name => "AUSNC")
item.save!
d = Document.new(:media_type => "image", :url => "http://localhost:3000/#")
d.corpus_item = item
d.save!

item =CorpusItem.new(:sub_corpus_name => "koorang",:title => "Koorang Item 5", :year => 2003, :corpus_name => "AUSNC")
item.save!
d = Document.new(:media_type => "video", :url => "http://localhost:3000/#")
d.corpus_item = item
d.save!

item =CorpusItem.new(:sub_corpus_name => "red",:title => "Red Item 1", :year => 1990, :corpus_name => "PARADISEC")
item.save!
d = Document.new(:media_type => "text", :url => "http://localhost:3000/#")
d.corpus_item = item
d.save!

item =CorpusItem.new(:sub_corpus_name => "red",:title => "Red Item 2", :year => 1999, :corpus_name => "PARADISEC")
item.save!
d = Document.new(:media_type => "video", :url => "http://localhost:3000/#")
d.corpus_item = item
d.save!

