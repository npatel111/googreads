class BookAdapter
  byebug
  API_KEY = "AIzaSyBSqFCs7nl1FzzygqCrKpqx-ZyGhlYHJuQ"
  attr_accessor :search_term, :api_response
  def self.hit_api(search_term)
    @uri = URI("https://www.googleapis.com/books/v1/volumes?q=#{search_term}&key#{API_KEY}")
    response = Net::HTTP.get(@uri)
    @api_response=  JSON.parse(response)
    byebug
  end

  def self.get_first_book(search_term)
    byebug
    self.hit_api(search_term)

  end

end
