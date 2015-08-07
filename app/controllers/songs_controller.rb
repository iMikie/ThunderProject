class SongsController < ApplicationController

# before_filter :authorize

# GET /songs
  def index
    @songs = @songs ||= Song.all
    # @songs = Song.all
  end

  def show
    @song = current_song
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
        options_string << key.to_s + " ilike ?"
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
    @song_number = Song.last.song_number + 1

  end

  def edit
    @song = current_song
    @song_number = @song.song_number
  end

  def create

    @render_club_photo = false

    respond_to do |format|
      if @song = Song.create(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render json: @song } # render(json: {})
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @song = current_song
    @render_club_photo = false
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render json: @song } # render(json: {})
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @song = current_song
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_path, notice: 'Song was deleted.' }
      format.json { render json: 'Song was deleted.' } # render(json: {})
    end
  end

  private
# Use callbacks to share common setup or constraints between actions.
  def current_song
    Song.find(params[:id])
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def song_params
    params.require(:song).permit(:title, :voicing, :composer, :arranger_one, :arranger_two, :category, :larger_work,
                                 :song_number)
  end

end