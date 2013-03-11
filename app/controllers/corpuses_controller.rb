class CorpusesController < ApplicationController
  # GET /corpuses
  # GET /corpuses.json
  def index
    @corpuses = Corpus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @corpuses }
    end
  end

  # GET /corpuses/1
  # GET /corpuses/1.json
  def show
    @corpus = Corpus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @corpus }
    end
  end

  # GET /corpuses/new
  # GET /corpuses/new.json
  def new
    @corpus = Corpus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @corpus }
    end
  end

  # GET /corpuses/1/edit
  def edit
    @corpus = Corpus.find(params[:id])
  end

  # POST /corpuses
  # POST /corpuses.json
  def create
    @corpus = Corpus.new(params[:corpus])

    respond_to do |format|
      if @corpus.save
        format.html { redirect_to @corpus, notice: 'Corpus was successfully created.' }
        format.json { render json: @corpus, status: :created, location: @corpus }
      else
        format.html { render action: "new" }
        format.json { render json: @corpus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /corpuses/1
  # PUT /corpuses/1.json
  def update
    @corpus = Corpus.find(params[:id])

    respond_to do |format|
      if @corpus.update_attributes(params[:corpus])
        format.html { redirect_to @corpus, notice: 'Corpus was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @corpus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /corpuses/1
  # DELETE /corpuses/1.json
  def destroy
    @corpus = Corpus.find(params[:id])
    @corpus.destroy

    respond_to do |format|
      format.html { redirect_to corpuses_url }
      format.json { head :ok }
    end
  end
end
