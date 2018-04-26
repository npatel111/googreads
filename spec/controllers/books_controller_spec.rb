# require 'rails_helper'
require 'spec_helper'

RSpec.describe BooksController, type: :controller do

  let(:invalid_attributes) do
    {
      title: nil,
      description: nil,
      image: "http://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781982103521/the-mist-9781982103521_lg.jpg",
      author_id: 1
    }
  end

  describe "basic listing, viewing and editing" do

    it "lists all books" do
      author = create(:author)
      book = create(:book)

      get :index
      expect(assigns(:books)).to eq([book])
    end

    it "views a single book" do
      author = create(:author)
      book = create(:book)

      get :show, params: { id: book.id }
      expect(assigns(:book)).to eq(book)
    end

  end

  context "creating a valid book" do

    it "creates a new book" do
      author = create(:author)
      book = create(:book)

      expect(Book.count).to eq(1)
    end

    it "creates a valid book" do
      author = create(:author)
      book = create(:book)

      expect(create(:book)).to be_valid
    end

    it 'belongs to an author' do
      author = create(:author)
      book = create(:book)

      expect(Author.last.books).to include(book)
    end

  end

  context "creating an invalid book" do
    # it "has not been persisted" do
    #   book = build(:book)
    #
    #   expect(book).to_not be_valid
    # end

    # it "re-renders the template" do
    #   book = build(:invalid_book)
    #
    #   expect(response).to render_template :new
    # end
    # it "re-renders the template" do
    #   book = create(:invalid_book)
    #   expect(response).to render_template("new")
    # end
  end

end
