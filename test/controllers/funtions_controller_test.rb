require 'test_helper'

class FuntionsControllerTest < ActionController::TestCase
  setup do
    @funtion = funtions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:funtions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create funtion" do
    assert_difference('Funtion.count') do
      post :create, funtion: { hora: @funtion.hora, movie_id: @funtion.movie_id, sala: @funtion.sala, theater_id: @funtion.theater_id }
    end

    assert_redirected_to funtion_path(assigns(:funtion))
  end

  test "should show funtion" do
    get :show, id: @funtion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @funtion
    assert_response :success
  end

  test "should update funtion" do
    patch :update, id: @funtion, funtion: { hora: @funtion.hora, movie_id: @funtion.movie_id, sala: @funtion.sala, theater_id: @funtion.theater_id }
    assert_redirected_to funtion_path(assigns(:funtion))
  end

  test "should destroy funtion" do
    assert_difference('Funtion.count', -1) do
      delete :destroy, id: @funtion
    end

    assert_redirected_to funtions_path
  end
end
