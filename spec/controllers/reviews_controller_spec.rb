require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  # let(:valid_attributes) do
  #
  # end
  #
  # t.integer  "rating"
  # t.string   "content"
  # t.integer  "book_id"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false
  # t.integer  "user_id"

  describe "basic listing, viewing and editing" do

    it "lists all reviews" do
      review = create(:review)

      get :index
      expect(assigns(:reviews)).to eq([review])
    end

    it "views a single review" do
      review = create(:review)

      get :show, { id: review.id }
      expect(assigns(:review)).to eq(review)
    end

    it "fetches a review for editing" do
      review = create(:review)

      get :edit, { id: review.id }
      expect(assigns(:review)).to eq(review)
    end
  end

  # context "creating a valid review" do
  #   # before { post(:create, { review: valid_attributes }) }
  #
  #   it "creates a new Review" do
  #     expect(Review.count).to eq(1)
  #   end
  #
  #   it "assigns and persists new review" do
  #     expect(assigns(:review)).to be_a(Review)
  #     expect(assigns(:review)).to be_persisted
  #   end
  #
  #   it "redirects to the created review" do
  #     expect(response).to redirect_to(Review.last)
  #   end
  # end
  #
  # context "creating an invalid review" do
  #   before { post(:create, { review: invalid_attributes}) }
  #
  #   it "has not been persisted" do
  #     expect(assigns(:review)).to be_new_record
  #   end
  #
  #   it "re-renders the template" do
  #     expect(response).to render_template("new")
  #   end
  # end
  #
  # context "updating a review with valid data" do
  #   let(:new_attributes) do
  #     { title: "Moon Safari" }
  #   end
  #   let(:review) { Review.create!(valid_attributes) }
  #
  #   before do
  #     patch :update, { id: review.id, review: new_attributes }
  #   end
  #
  #   it "updates the review" do
  #     review.reload
  #     expect(review.title).to eq("Moon Safari")
  #   end
  #
  #   it "redirects to the review" do
  #     expect(response).to redirect_to(review)
  #   end
  # end
  #
  # context "updating a review with invalid data" do
  #   let(:review) { Review.create!(valid_attributes) }
  #   before do
  #     patch :update, { id: review.id, review: invalid_attributes }
  #   end
  #
  #   it "does not persist changes" do
  #     expect(review.title).to eq("Talisman")
  #   end
  #
  #   it "re-renders the 'edit' template" do
  #     expect(response).to render_template("edit")
  #   end
  # end
  #
  # context "destroying a review" do
  #   let(:review) { Review.create!(valid_attributes) }
  #   before do
  #     delete :destroy, { id: review.id }
  #   end
  #
  #   it "destroys the requested review" do
  #     expect(Review.count).to eq(0)
  #   end
  #
  #   it "redirects to the reviews list" do
  #     expect(response).to redirect_to(reviews_url)
  #   end
  # end

end
