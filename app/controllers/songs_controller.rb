class SongsController < ApplicationController
  def index
    @current_user = User.find(session[:user_id])
    # render json: @current_user
    # @users = User.all
    # render json:@users
    @songs = Song.all
    # render json: @songs
  end

  def show
    @song = Song.find(params[:id])
    # @playlists = @song.playlists
    # render json:@song
  end

  def add
    song = Song.find(params[:id])
    user = User.find(session[:user_id])
    playlist = Playlist.find_by_user_id_and_song_id(session[:user_id], params[:id])
    if playlist
      playlist.times +=1
      playlist.save
    else
      playlist = Playlist.create(user:user, song:song, times:1)
    end
    # render json: session[:user_id]
    redirect_to '/songs'
  end

  def create
    # fail
    new_song = Song.new(song_params)
    if new_song.valid?
      new_song.save
      user = User.find(session[:user_id])
      playlist = Playlist.create(user:user, song:new_song, times:1)
      redirect_to '/songs'
    else
      flash[:errors] = new_song.errors.full_messages
      redirect_to '/songs'
    end
  end

  private
		def song_params
			params.require(:song).permit(:title,:artist)
		end
end
