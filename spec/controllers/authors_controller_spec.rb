# require 'rails_helper'
require 'spec_helper'

RSpec.describe AuthorsController, type: :controller do
  let(:valid_attributes) do
    {
      name: "Cassandra Clare",
    }
  end

  describe "basic listing, viewing and editing" do
    let(:author) { Author.create!(valid_attributes) }

    it "lists all authors" do
      get :index
      expect(assigns(:authors)).to eq([author])
    end

    it "views a single song" do
      get :show, params: { id: author.id }
      expect(assigns(:author)).to eq(author)
    end
  end

end
