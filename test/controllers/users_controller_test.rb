require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test 'should get user profile' do
    get :show
    assert_response :success
  end
end
