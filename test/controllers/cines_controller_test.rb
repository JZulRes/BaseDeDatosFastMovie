require 'test_helper'

class CinesControllerTest < ActionController::TestCase
  setup do
    @cine = cines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cine" do
    assert_difference('Cine.count') do
      post :create, cine: { name: @cine.name, theater_id: @cine.theater_id }
    end

    assert_redirected_to cine_path(assigns(:cine))
  end

  test "should show cine" do
    get :show, id: @cine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cine
    assert_response :success
  end

  test "should update cine" do
    patch :update, id: @cine, cine: { name: @cine.name, theater_id: @cine.theater_id }
    assert_redirected_to cine_path(assigns(:cine))
  end

  test "should destroy cine" do
    assert_difference('Cine.count', -1) do
      delete :destroy, id: @cine
    end

    assert_redirected_to cines_path
  end
end
