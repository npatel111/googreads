class BooksController < ApplicationController
  API_KEY = "AIzaSyBSqFCs7nl1FzzygqCrKpqx-ZyGhlYHJuQ"


  def new
    @book = Book.new
  end

  def create
    #ugh, will move to adapter soon, but on first try wasn't recognizing BooksController::BookAdapter??
    @book = Book.new
    @search_term = params["book"]["title"]
    @uri = URI("https://www.googleapis.com/books/v1/volumes?q=#{@search_term}&key#{API_KEY}")
    response = Net::HTTP.get(@uri)
    @api_response=  JSON.parse(response)
    @book.title = @api_response["items"].first["volumeInfo"]["title"]
    @book.description = @api_response["items"].first["volumeInfo"]["description"]
    @book.image = @api_response["items"].first["volumeInfo"]["imageLinks"]["thumbnail"]
    @author_name = @api_response["items"].first["volumeInfo"]["authors"].first
    @book.author = Author.find_or_create_by(name: @author_name)
    @genre_names = @api_response["items"].first["volumeInfo"]["categories"] || ["unstated"]
    # @book.genres = ["unstated"] if @genre_names == "unstated"
    @genres_all = @genre_names.map { |genre| Genre.find_or_create_by(name: genre)}
    @book.genres = @genres_all
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @search_term = params["book"]["title"]
    @uri = URI("https://www.googleapis.com/books/v1/volumes?q=#{@search_term}&key#{API_KEY}")
    response = Net::HTTP.get(@uri)
    @api_response=  JSON.parse(response)
    @book.title = @api_response["items"].first["volumeInfo"]["title"]
    @book.description = @api_response["items"].first["volumeInfo"]["description"]
    @book.image = @api_response["items"].first["volumeInfo"]["imageLinks"]["thumbnail"]
    @author_name = @api_response["items"].first["volumeInfo"]["authors"].first
    @book.author = Author.find_or_create_by(name: @author_name)
    @genre_names = @api_response["items"].first["volumeInfo"]["categories"] || ["unstated"]
    @genres_all = @genre_names.map { |genre| Genre.find_or_create_by(name: genre)}
    @book.genres = @genres_all
    @book.save
    redirect_to book_path(@book)
  end

  def index
    @books = Book.all
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to authors_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :image, :author_id)
  end
end
