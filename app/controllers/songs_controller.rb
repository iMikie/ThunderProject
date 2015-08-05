class SongsController < ApplicationController

# before_filter :authorize

  # GET /songs
  def index
     @songs = @songs ||= Song.all
    # @songs = Song.all
  end

  def show
    song_number = params[:id]
    @song = Song.where(song_number: song_number).first
  end

#POST /songs/search
  def search

    title = params[:title]
    composer = params[:composer]
    larger_work = params[:larger_work]
    arranger_one = params[:arranger_one]
    arranger_two = params[:arranger_two]
    voicing = params[:voicing]
    description = params[:description]
    options_string = ""
    options_params = []
    params.each do |key, value|
      # puts "key: #{key}   value: #{value}"
      next if ["utf8", "authenticity_token", "commit", "controller", "action"].include? key
      if value.length != 0
        if options_string.length != 0
          options_string << " and "
        end
        options_string << key.to_s + " like ?"
        options_params << '%' + value + '%'
      end
    end

    @songs = Song.where(options_string, *options_params)
    #Song.where("title like ? and description like ?", titleval, descval).to_sql

    render "songs/index"
  end

  # GET /songs/1
  # GET /songs.json

  # GET /songs/new
  # assumes views/songs/new.html.erb
  def new
    @song = Song.new
  end

  def edit

  end

  def create
    @render_club_photo = false
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render json: @song}# render(json: {})
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
  end
  def update
    @render_club_photo = false

  end
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:title, :voicing, :composer, :arranger_one, :arranger_two, :category, :larger_work)
    end
  end

end