class BooksController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :show]
  attr_accessor :book

  def new
    @book = Book.new
  end

  def create
    @search_term = params["book"]["title"]
    @book = BookAdapter.get_first_book(@search_term)
    if @book.save
      @shelf = Shelf.find_or_create_by(name: "Searched", user_id: session["user_id"])
      @shelf.books << @book
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
  end

  #FEEL LIKE WE WOULDN'T NEED TO EDIT THE BOOK INFO?
  # def edit
  #   @book = Book.find(params[:id])
  #   if current_user.shelves.select {|shelf| shelf.name=="Searched"}.include?(@book)
  #     render :edit
  #   else
  #     redirect_to books_path
  #   end
  # end
  #
  # def update
  #   @book = Book.find(params[:id])
  #   @search_term = params["book"]["title"]
  #   @uri = URI("https://www.googleapis.com/books/v1/volumes?q=#{@search_term}&key#{API_KEY}")
  #   response = Net::HTTP.get(@uri)
  #   @api_response=  JSON.parse(response)
  #   @book.title = @api_response["items"].first["volumeInfo"]["title"]
  #   @book.description = @api_response["items"].first["volumeInfo"]["description"]
  #   @book.image = @api_response["items"].first["volumeInfo"]["imageLinks"]["thumbnail"]
  #   @author_name = @api_response["items"].first["volumeInfo"]["authors"].first
  #   @book.author = Author.find_or_create_by(name: @author_name)
  #   @genre_names = @api_response["items"].first["volumeInfo"]["categories"] || ["unstated"]
  #   @genres_all = @genre_names.map { |genre| Genre.find_or_create_by(name: genre)}
  #   @book.genres = @genres_all
  #   @book.save
  #   redirect_to book_path(@book)
  # end
  #

  #
  # def destroy
  #   @book = Book.find(params[:id])
  #   @book.destroy
  #   redirect_to authors_path
  # end

  private

  def book_params
    params.require(:book).permit(:title, :description, :image, :author_id)
  end
end
