# require 'rails_helper'
require 'spec_helper'

RSpec.describe ShelvesController, type: :controller do
  let(:valid_attributes) do
    {
      name: "Stephen King Favs!",
      user_id: 1
    }
  end

  # before(:each) do
  #   user = create(:user)
  #   shelf = create(:shelf)
  # end

  describe "basic listing, viewing and editing" do
    # let(:shelf) { Shelf.create!(valid_attributes) }
    #
    it "lists all shelves" do
      user = create(:user)
      shelf = create(:shelf)

      get :index
      expect(assigns(:shelves)).to eq([shelf])
    end

    # it "views a single shelf" do
    #   user = create(:user)
    #   shelf = create(:shelf)
    #   pp shelf
    #   get :show, params: { id: shelf.id }
    #   expect(assigns(:shelf)).to eq:(shelf)
    # end

  end

  context "creating a valid shelf" do

    it "creates a new shelf" do
      shelf = create(:shelf)

      expect(Shelf.count).to eq(1)
    end

    it "creates a valid shelf" do
      shelf = create(:shelf)

      expect(create(:shelf)).to be_valid
    end

    it 'belongs to an user' do
      user = create(:user)
      shelf = create(:shelf)

      expect(User.last.shelves).to include(shelf)
    end

  end

  context "updating a shelf with valid data" do
    # let(:new_attributes) do
    #   { name: "Mixed Feelings" }
    # end
    # # let(:user) {User.create!(name: "John Grisham", password: "TheFirm") }
    #
    # before :each do
    #
    #   @user = create(:user,
    #     name: 'JG',
    #     password: "fdfdfs"
    #   )
    #
    #   @shelf = create(:shelf,
    #     name: 'John Grisham 4eva!',
    #     user_id: @user.id
    #   )
    # end
    #
    # it "updates the shelf" do
    #   pp @shelf
    #    binding.pry
    #   patch :update, params: {id: @shelf, @shelf: new_attributes }
    #   @shelf.reload
    #   # expect(@shelf.name).to eq 'Larry'
    #   # expect(@contact.lastname).to eq 'Smith'
    #   pp @shelf
    #
    #   # user = create(:user)
    #   # shelf = create(:shelf)
    #   # patch :update, { id: shelf, shelf: {name: "Mixed Feelings", user_ud: user.id}}
    #   # shelf.reload
    #   expect(@shelf.name).to eq("Mixed Feelings")
    # end

    # it "redirects to the song" do
    #   expect(response).to redirect_to(song)
    # end
  end

  # context "updating a song with invalid data" do
  #   let(:song) { Song.create!(valid_attributes) }
  #   before do
  #     patch :update, { id: song.id, song: invalid_attributes }
  #   end
  #
  #   it "does not persist changes" do
  #     expect(song.title).to eq("Talisman")
  #   end
  #
  #   it "re-renders the 'edit' template" do
  #     expect(response).to render_template("edit")
  #   end
  # end

  # context "destroying a song" do
  #   let(:song) { Song.create!(valid_attributes) }
  #   before do
  #     delete :destroy, { id: song.id }
  #   end
  #
  #   it "destroys the requested song" do
  #     expect(Song.count).to eq(0)
  #   end
  #
  #   it "redirects to the songs list" do
  #     expect(response).to redirect_to(songs_url)
  #   end
  # end

end
