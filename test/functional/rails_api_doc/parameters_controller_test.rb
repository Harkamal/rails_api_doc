require 'test_helper'

module RailsApiDoc
  class ParametersControllerTest < ActionController::TestCase
    setup do
      @parameter = parameters(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:parameters)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create parameter" do
      assert_difference('Parameter.count') do
        post :create, parameter: { api_id: @parameter.api_id, name: @parameter.name, note: @parameter.note, value: @parameter.value }
      end
  
      assert_redirected_to parameter_path(assigns(:parameter))
    end
  
    test "should show parameter" do
      get :show, id: @parameter
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @parameter
      assert_response :success
    end
  
    test "should update parameter" do
      put :update, id: @parameter, parameter: { api_id: @parameter.api_id, name: @parameter.name, note: @parameter.note, value: @parameter.value }
      assert_redirected_to parameter_path(assigns(:parameter))
    end
  
    test "should destroy parameter" do
      assert_difference('Parameter.count', -1) do
        delete :destroy, id: @parameter
      end
  
      assert_redirected_to parameters_path
    end
  end
end
