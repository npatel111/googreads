class ShelvesController < ApplicationController
  def new
    @shelf = Shelf.new
  end

  def create
    @shelf = Shelf.new(shelf_params)
    @shelf_books = params["shelf"]["book_ids"].map {|id| Book.find(id)}
    @shelf.books = @shelf_books
    if @shelf.save
      byebug
      redirect_to shelf_path(@shelf)
    else
      byebug
      render :new

    end
  end

  def show
    @shelf = Shelf.find(params[:id])
  end

  def edit
    @shelf = Shelf.find(params[:id])
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
    params.require(:shelf).permit(:name, :book_ids)
  end
end
