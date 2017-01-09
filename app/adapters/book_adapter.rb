class BookAdapter
  API_KEY = "AIzaSyBSqFCs7nl1FzzygqCrKpqx-ZyGhlYHJuQ"
  attr_accessor :search_term, :api_response
  def self.hit_api(search_term)
    @uri = URI("https://www.googleapis.com/books/v1/volumes?q=#{search_term}&key#{API_KEY}")
    response = Net::HTTP.get(@uri)
    @api_response=  JSON.parse(response)
  end

  def self.get_first_book(search_term)
    @book = Book.new
    self.hit_api(search_term)
    self.add_attributes(@book)
  end

  def self.add_attributes(book)
    book.title = @api_response["items"].first["volumeInfo"]["title"]
    book.description = @api_response["items"].first["volumeInfo"]["description"]
    book.image = @api_response["items"].first["volumeInfo"]["imageLinks"]["thumbnail"]
    @author_name = @api_response["items"].first["volumeInfo"]["authors"].first
    book.author = Author.find_or_create_by(name: @author_name)
    @genre_names = @api_response["items"].first["volumeInfo"]["categories"] || ["unstated"]
    @genres_all = @genre_names.map { |genre| Genre.find_or_create_by(name: genre)}
    book.genres = @genres_all
    return book
  end



end
