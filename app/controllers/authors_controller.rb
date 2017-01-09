class AuthorsController < ApplicationController
  # wait I think we want to only have index and show methods here because doesn't make sense to add an author or edit one, google books has all authors, and up to date info?. If I do add all CRUD actions, would just need to add user_id to table for authors for belongs to relationship
  #so no need to have before action require login

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to author_path(@author)
    else
      render :new
    end
  end

  def show
    @author = Author.find(params[:id])
  end

  def edit
    @author = Author.find(params[:id])
    if current_user.id
  end

  def update
    @author = Author.find(params[:id])
    @author.update(author_params)
    redirect_to author_path(@author)
  end

  def index
    @authors = Author.all
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to authors_path
  end

  private

  def author_params
    params.require(:author).permit(:name)
  end

end
