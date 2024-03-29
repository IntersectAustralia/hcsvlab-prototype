import os.path
import fnmatch
import re
import json
import urllib
import urllib2

CORPUS = "AUSNC"
SUB_CORPUS = "cooee"

CI_URL   = "http://localhost:3000/corpus_items.json/"
DOCS_URL = "http://localhost:3000/documents.json/"

AUSNC_URL = "http://gsw1-hcsvlab-test2-vm.intersect.org.au/ausnc/cooee/"

FOLDER = "/data/ausnc/ausnc_corpora_processed/cooee"

for filename in os.listdir(FOLDER):
  if fnmatch.fnmatch(filename,'*-metadata.rdf'):

    index = filename.index("-metadata.rdf")
    id = filename[:index]

    with open (os.path.join(FOLDER,filename), "r") as tmp_file:
          rdf_file=tmp_file.read().replace('\n', '')

    m = re.search('dc:created *"(.+?)"',rdf_file)
    year = ""
    if m:
      year = m.group(1);

    print "Corpus Item: " + id

    jdata = json.dumps({'title':id,'year':year,'corpus_name':CORPUS,'sub_corpus_name':SUB_CORPUS})

    req = urllib2.Request(CI_URL, jdata, {'Content-Type':'application/json'})
    try:
       resp = urllib2.urlopen(req)
       the_result = resp.read()
       ci_json = json.loads(the_result)
       corpus_item_id = str(ci_json['id'])
    except urllib2.HTTPError, e:
       print( "Reques Failed!")
       raise e

    original_file = os.path.join(FOLDER,id+".txt")
    if (os.path.exists(original_file)):
      print "Ingest original document"
      url = AUSNC_URL + id + ".txt"
      type = "original"
      jdata = json.dumps({'corpus_item_id':corpus_item_id,'media_type':type,'url':url})

      req = urllib2.Request(DOCS_URL, jdata, {'Content-Type':'application/json'})
      try:
        resp = urllib2.urlopen(req)
        the_result = resp.read()
      except urllib2.HTTPError, e:
        print( "Request Failed!")

    raw_file = os.path.join(FOLDER,id+"-raw.txt")
    if(os.path.exists(raw_file)):
      print "Ingest raw document"
      url = AUSNC_URL + id + "-raw.txt"
      type = "raw"
      jdata = json.dumps({'corpus_item_id':corpus_item_id,'media_type':type,'url':url})

      req = urllib2.Request(DOCS_URL, jdata, {'Content-Type':'application/json'})
      try:
        resp = urllib2.urlopen(req)
        the_result = resp.read()
      except urllib2.HTTPError, e:
        print( "Request Failed!")

    text_file = os.path.join(FOLDER,id+"-plain.txt")
    if (os.path.exists(text_file)):
      print "Ingest text document"
      url = AUSNC_URL + id + "-plain.txt"
      type = "text"
      jdata = json.dumps({'corpus_item_id':corpus_item_id,'media_type':type,'url':url})

      req = urllib2.Request(DOCS_URL, jdata, {'Content-Type':'application/json'})
      try:
        resp = urllib2.urlopen(req)
        the_result = resp.read()
      except urllib2.HTTPError, e:
        print( "Request Failed!")
