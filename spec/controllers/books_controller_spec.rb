# require 'rails_helper'
require 'spec_helper'

RSpec.describe BooksController, type: :controller do

  describe "basic listing, viewing and editing" do

    it "lists all books" do
      author = create(:author)
      book = create(:book)

      get :index
      expect(assigns(:books)).to eq([book])
    end

    it "views a single book" do
      get :show, params: { id: book.id }
      expect(assigns(:book)).to eq(book)
    end

  end

  context "creating a valid book" do
      let(:author) { Author.create!(name: "Stephen King") }
      let(:book) { Book.create!(valid_attributes) }

    it "creates a new book" do
      expect(Book.count).to eq(1)
    end

    # it "assigns and persists new book" do
    #   pp book
    #   pp Book.count
    #   expect(assigns(:book)).to be_a(Book)
    #   expect(assigns(:book)).to be_persisted
    # end
    #
    # it "redirects to the created book" do
    #   expect(response).to redirect_to(Book.last)
    # end
  end

  # context "creating an invalid book" do
  #   before { post(:create, params: { book: invalid_attributes}) }
  #
  #   it "has not been persisted" do
  #     expect(assigns(:book)).to be_new_record
  #   end
  #
  #   it "re-renders the template" do
  #     expect(response).to render_template("new")
  #   end
  # end

end
