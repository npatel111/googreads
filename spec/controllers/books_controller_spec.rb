# require 'rails_helper'
require 'spec_helper'

RSpec.describe BooksController, type: :controller do
  let(:valid_attributes) do
    {
      title: "The Mist",
      description: "#1 New York Times bestselling author Stephen King’s terrifying novella about a town engulfed in a dense, mysterious mist as humanity makes its last stand against unholy destruction—originally published in the acclaimed short story collection Skeleton Crew and made into a TV series, as well as a feature film starring Thomas Jane and Marcia Gay Harden.
In the wake of a summer storm, terror descends...David Drayton, his son Billy, and their neighbor Brent Norton join dozens of others and head to the local grocery store to replenish supplies following a freak storm. Once there, they become trapped by a strange mist that has enveloped the town. As the confinement takes its toll on their nerves, a religious zealot, Mrs. Carmody, begins to play on their fears to convince them that this is God’s vengeance for their sins. She insists a sacrifice must be made and two groups—those for and those against—are aligned. Clearly, staying in the store may prove fatal, and the Draytons, along with store employee Ollie Weeks, Amanda Dumfries, Irene Reppler, and Dan Miller, attempt to make their escape. But what’s out there may be worse than what they left behind.
This exhilarating novella explores the horror in both the enemy you know—and the one you can only imagine.",
      image: "http://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781982103521/the-mist-9781982103521_lg.jpg",
      author_id: 0
    }
  end

  let(:invalid_attributes) do
    {
      title: "The Mist",
      description: nil,
      image: "http://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781982103521/the-mist-9781982103521_lg.jpg",
      author_id: 0
    }
  end

  let(:author) do
    {
      name: "Stephen King",
    }
  end

  describe "basic listing, viewing and editing" do
    let(:book) { Book.create!(valid_attributes) }
    let(:author) { Author.create!(author) }

    it "lists all books" do
      get :index
      expect(assigns(:books)).to eq([book])
    end

    it "views a single book" do
      get :show, params: { id: book.id }
      expect(assigns(:book)).to eq(book)
    end

  end

  context "creating a valid book" do
    before { post(:create, params: { book: valid_attributes }) }

    it "creates a new book" do
      expect(Book.count).to eq(1)
    end

    it "assigns and persists new book" do
      expect(assigns(:book)).to be_a(Book)
      expect(assigns(:book)).to be_persisted
    end

    it "redirects to the created book" do
      expect(response).to redirect_to(Book.last)
    end
  end

  context "creating an invalid book" do
    before { post(:create, params: { book: invalid_attributes}) }

    it "has not been persisted" do
      expect(assigns(:book)).to be_new_record
    end

    it "re-renders the template" do
      expect(response).to render_template("new")
    end
  end

end
