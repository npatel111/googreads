class AuthorsController < ApplicationController
  # just want index and show methods, so commented out everything else


  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end


  # def new
  #   @author = Author.new
  # end
  #
  # def create
  #   @author = Author.new(author_params)
  #   if @author.save
  #     redirect_to author_path(@author)
  #   else
  #     render :new
  #   end
  # end



  # def edit
  #   @author = Author.find(params[:id])
  #   if current_user.id
  # end
  #
  # def update
  #   @author = Author.find(params[:id])
  #   @author.update(author_params)
  #   redirect_to author_path(@author)
  # end

  # def destroy
  #   @author = Author.find(params[:id])
  #   @author.destroy
  #   redirect_to authors_path
  # end

  private

  def author_params
    params.require(:author).permit(:name)
  end

end
