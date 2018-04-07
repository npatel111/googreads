class ShelvesController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index]
  # attr_accessor :shelves, :shelf
  def new
    @shelf = Shelf.new
  end

  def create
    @shelf = Shelf.new(shelf_params)
    @shelf_books = params["shelf"]["book_ids"].map {|id| Book.find(id)}
    @shelf.books = @shelf_books
    if @shelf.save
      redirect_to shelf_path(@shelf)
    else
      render :new
    end
  end

  def show
    @shelf = Shelf.find(params[:id])
    if current_user.shelves.include?(@shelf)
      render :show
    else
      redirect_to shelves_path
    end
  end

  def edit
    @shelf = Shelf.find(params[:id])
    if current_user.shelves.include?(@shelf)
      render :edit
    else
      redirect_to shelves_path
    end
  end

  def update
    @shelf= Shelf.find(params[:id])
    @shelf.update(shelf_params)
    @shelf_books = params["shelf"]["book_ids"].map {|id| Book.find(id)}
    @shelf.books = @shelf_books
    @shelf.save
    redirect_to shelf_path(@shelf)
  end

  def index
    @shelves = Shelf.all
  end

  def destroy
    @shelf= Shelf.find(params[:id])
    @shelf.destroy
    redirect_to shelves_path
  end

  private

  def shelf_params
    params.require(:shelf).permit(:name, :book_ids, :user_id)
  end
end
