import os.path
import fnmatch
import re
import json
import urllib
import urllib2

CORPUS = "AUSNC"
SUB_CORPUS = "mitchel delbridge"

DOCS_URL = "http://localhost:3000/documents.json/"

AUSNC_URL = "http://gsw1-hcsvlab-test2-vm.intersect.org.au/ausnc/md/"

FOLDER = "/home/theeban/data/ausnc/md"

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

    audio_file = os.path.join(FOLDER,id+".wav")
    if (os.path.exists(audio_file)):
      print "Ingest audio document"
      url = AUSNC_URL + id + ".wav"
      type = "audio"
      jdata = json.dumps({'title':id,'year':year,'corpus_name':CORPUS,'sub_corpus_name':SUB_CORPUS,'media_type':type,'url':url})

      req = urllib2.Request(DOCS_URL, jdata, {'Content-Type':'application/json'})
      try:
        resp = urllib2.urlopen(req)
        the_result = resp.read()
      except urllib2.HTTPError, e:
        print( "Request Failed!")
