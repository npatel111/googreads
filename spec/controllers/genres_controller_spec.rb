# require 'rails_helper'
require 'spec_helper'

RSpec.describe GenresController, type: :controller do
  let(:valid_attributes) do
    {
      name: "romance",
    }
  end

  describe "basic listing, viewing and editing" do
    let(:genre) { Genre.create!(valid_attributes) }

    it "lists all genres" do
      get :index
      expect(assigns(:genres)).to eq([genre])
    end

    it "views a single song" do
      get :show, params: { id: genre.id }
      expect(assigns(:genre)).to eq(genre)
    end
  end

end
