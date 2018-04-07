class BookAdapter
  API_KEY = "AIzaSyBSqFCs7nl1FzzygqCrKpqx-ZyGhlYHJuQ"
  # attr_accessor :search_term, :api_response
  def self.hit_api(search_term)
    @uri = URI("https://www.googleapis.com/books/v1/volumes?q=#{search_term}&key#{API_KEY}")
    response = Net::HTTP.get(@uri)
    @api_response=  JSON.parse(response)
  end

  def self.get_first_book(search_term)
    @book = Book.new
    self.hit_api(search_term)
    self.add_attributes(@book)
    @book
  end

  def self.add_attributes(book)
    @api_response_body = @api_response["items"].first["volumeInfo"]
    book.title = @api_response_body["title"]
    book.description = @api_response_body["description"]
    self.add_image(book)
    self.add_author(book)
    self.add_genres(book)
    book
  end

  def self.add_image(book)
    book.image =
      if @api_response_body["imageLinks"]
        @api_response_body["imageLinks"]["thumbnail"]
      else
        "http://i.giphy.com/l0HlIzr4NrsuRFHY4.gif"
      end
  end

  def self.add_author(book)
    author_name = @api_response_body["authors"].first
    book.author = Author.find_or_create_by(name: author_name)
  end

  def self.add_genres(book)
    genre_names = @api_response_body["categories"] || ["unstated"]
    genres_all = genre_names.map { |genre| Genre.find_or_create_by(name: genre)}
    book.genres = genres_all
  end



end
