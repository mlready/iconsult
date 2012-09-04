require 'test_helper'

class ConsultantsControllerTest < ActionController::TestCase
  setup do
    @consultant = consultants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consultants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consultant" do
    assert_difference('Consultant.count') do
      post :create, consultant: { city: @consultant.city, first_name: @consultant.first_name, image: @consultant.image, last_name: @consultant.last_name, state: @consultant.state, street: @consultant.street, zipcode: @consultant.zipcode }
    end

    assert_redirected_to consultant_path(assigns(:consultant))
  end

  test "should show consultant" do
    get :show, id: @consultant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @consultant
    assert_response :success
  end

  test "should update consultant" do
    put :update, id: @consultant, consultant: { city: @consultant.city, first_name: @consultant.first_name, image: @consultant.image, last_name: @consultant.last_name, state: @consultant.state, street: @consultant.street, zipcode: @consultant.zipcode }
    assert_redirected_to consultant_path(assigns(:consultant))
  end

  test "should destroy consultant" do
    assert_difference('Consultant.count', -1) do
      delete :destroy, id: @consultant
    end

    assert_redirected_to consultants_path
  end
end
