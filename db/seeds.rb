# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

item =CorpusItem.new(:title => "koorang", :year => 1999, :corpus_name => "AUSNC")
item.save!
d = Document.new(:media_type => "text")
d.corpus_item = item
d.save!

item =CorpusItem.new(:title => "koorang", :year => 2001, :corpus_name => "AUSNC")
item.save!
d = Document.new(:media_type => "image")
d.corpus_item = item
d.save!

item =CorpusItem.new(:title => "koorang", :year => 2001, :corpus_name => "AUSNC")
item.save!
d = Document.new(:media_type => "image")
d.corpus_item = item
d.save!

item =CorpusItem.new(:title => "koorang", :year => 2006, :corpus_name => "AUSNC")
item.save!
d = Document.new(:media_type => "image")
d.corpus_item = item
d.save!

item =CorpusItem.new(:title => "koorang", :year => 2003, :corpus_name => "AUSNC")
item.save!
d = Document.new(:media_type => "video")
d.corpus_item = item
d.save!

item =CorpusItem.new(:title => "red", :year => 1990, :corpus_name => "PARADISEC")
item.save!
d = Document.new(:media_type => "text")
d.corpus_item = item
d.save!

item =CorpusItem.new(:title => "red", :year => 1999, :corpus_name => "PARADISEC")
item.save!
d = Document.new(:media_type => "video")
d.corpus_item = item
d.save!

