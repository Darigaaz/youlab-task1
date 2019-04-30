require File.expand_path('../../test_helper', __FILE__)

class CountersControllerTest < ActionDispatch::IntegrationTest
  test "GET /counters" do
    get '/counters'
    assert_response :success
    assert_equal 'text/html', response.content_type
  end
end
