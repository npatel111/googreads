class GenresController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :show]

  # I think we want to only have index and show methods here because doesn't make sense to add a genre, you'd just add a shelf.

  def show
    @genre = Genre.find(params[:id])
  end

  def index
    @genres = Genre.all
  end

  # def new
  #   @genre = Genre.new
  # end
  #
  # def create
  #   @genre = Genre.new(genre_params)
  #   if @genre.save
  #     redirect_to genre_path(@genre)
  #   else
  #     render :new
  #   end
  # end
  #
  # def edit
  #   @genre = Genre.find(params[:id])
  # end
  #
  # def update
  #   @genre = Genre.find(params[:id])
  #   @genre.update(genre_params)
  #   redirect_to genre_path(@genre)
  # end
  #
  # def destroy
  #   @genre = Genre.find(params[:id])
  #   @genre.destroy
  #   redirect_to genres_path
  # end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
