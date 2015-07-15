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
      puts "key: #{key}   value: #{value}"
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
    #@songs = Song.where("title like ?" , '%Noel%')
    # @songs.each do |song|
    #   puts song.inspect
    # end

    render "songs/index"
  end

  # GET /songs/1
  # GET /songs.json

  # GET /songs/new
  # assumes views/songs/new.html.erb
  def new
    @render_club_photo = false
    @song = Song.new
  end


end