class WordsController < ApplicationController
  load_and_authorize_resource

  # GET /words
  # GET /words.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json 
    end
  end

  # GET /words/1
  # GET /words/1.json
  def show
    @word = Word.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @word }
    end
  end

  # GET /words/new
  # GET /words/new.json
  def new
    @word = Word.new
    @wh = @word.word_histories.build
    @word.definitions.build
    @word.usages.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @word }
    end
  end

  # GET /words/1/edit
  def edit
    @word = Word.find(params[:id])
    @word.word_histories.build(
      :language_id => @word.current.language_id,
      :part_of_speech_id => @word.current.part_of_speech_id,
      :part_a => @word.word_histories.first.part_a,
      :part_b => @word.word_histories.first.part_b,
      :part_c => @word.word_histories.first.part_c,
      :part_d => @word.word_histories.first.part_d,
      :part_e => @word.word_histories.first.part_e,
      :part_f => @word.word_histories.first.part_f
    )
  end

  # POST /words
  # POST /words.json
  def create
    @word = Word.new(params[:word])

    respond_to do |format|
      if @word.save
        format.html { redirect_to @word, notice: 'Word was successfully initialized.' }
        format.json { render json: @word, status: :created, location: @word }
      else
        format.html { render action: "new" }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /words/1
  # PUT /words/1.json
  def update
    @word = Word.find(params[:id])

    respond_to do |format|
      if @word.update_attributes(params[:word])
        format.html { redirect_to @word, notice: 'Word was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @word = Word.find(params[:id])
    @word.destroy

    respond_to do |format|
      format.html { redirect_to words_url }
      format.json { head :no_content }
    end
  end
end
