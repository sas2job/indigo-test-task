require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    books = [
      {author: "Test Author 1", name: "Test book 1"},
      {author: "Test Author 2", name: "Test book 2"}
      ]
    get '/api/v1/books/'
    request_books = JSON.parse(response.body)
    assert_equal(
      books.count, 
      request_books.count)
    assert_response :success
  end
end
