require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get '/api/v1/books/'
    request_books = JSON.parse(response.body)
    assert_equal(
      request_books.count, Book.count
    )
    assert_response :success
  end
end
