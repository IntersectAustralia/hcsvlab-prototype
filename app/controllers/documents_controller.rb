class DocumentsController < ApplicationController

  # POST /documents
  def search
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def index
    @search = Document.search do
      fulltext params[:search] #optional keyword search
      
      with(:year).greater_than(params[:year_from]) if params[:year_from].present?
      with(:year).less_than(params[:year_to])if params[:year_to].present?
      
      facet(:corpus_name)
      with(:corpus_name, params[:corpus_name]) if params[:corpus_name].present?
      
      facet(:sub_corpus_name)
      with(:sub_corpus_name, params[:sub_corpus_name]) if params[:sub_corpus_name].present?
      
      facet(:media_type)
      with(:media_type, params[:media_type]) if params[:media_type].present?

      order_by(:title, :asc)
      
      paginate :page=> 1, :per_page => 5000
    end
    @documents = @search.results

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @documents }
    end
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    @document = Document.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document }
    end
  end

  # GET /documents/new
  # GET /documents/new.json
  def new
    @document = Document.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @document }
    end
  end

  # GET /documents/1/edit
  def edit
    @document = Document.find(params[:id])
  end

  # POST /documents
  # POST /documents.json
  def create
    @corpus_item = CorpusItem.find(params[:corpus_item_id])
    @document = Document.new(params[:document]) 
    @document.corpus_item = @corpus_item
    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render json: @document, status: :created, location: @document }
      else
        format.html { render action: "new" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /documents/1
  # PUT /documents/1.json
  def update
    @document = Document.find(params[:id])

    respond_to do |format|
      if @document.update_attributes(params[:document])
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document = Document.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.html { redirect_to documents_url }
      format.json { head :ok }
    end
  end



end
