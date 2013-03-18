module DocumentsHelper

	def get_python_query
		python_string = "from hcsvlab.query import Query\nurl = 'http://gsw1-hcsvlab-test3-vm.intersect.org.au:8080/documents.json'\n"
		python_string << "query = Query(url)\n"
		query_fields = %w[corpus_name sub_corpus_name year_from year_to media_type]
		query_hash = params.select { |k, v| query_fields.include? k unless v.empty? }
		python_string << "params = " + query_hash.to_s.gsub('=>', ': ') + "\n"
		python_string << "query.query(params)\n"
		python_string << "query.download('my_corpus')\t# change 'my_corpus' to the name of the directory you want to download to\n"
	end
end
