class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params(:title, :artist_name, :genre, :released, :release_year))
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @song.update(song_params(:title, :artist_name, :genre, :released, :release_year))
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params(*args)
    params.require(:song).permit(*args)
  end

end
