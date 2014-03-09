require 'test_helper'

module RailsApiDoc
  class ApisControllerTest < ActionController::TestCase
    setup do
      @api = apis(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:apis)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create api" do
      assert_difference('Api.count') do
        post :create, api: { api_group: @api.api_group, name: @api.name, request_type: @api.request_type, url: @api.url, version: @api.version }
      end
  
      assert_redirected_to api_path(assigns(:api))
    end
  
    test "should show api" do
      get :show, id: @api
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @api
      assert_response :success
    end
  
    test "should update api" do
      put :update, id: @api, api: { api_group: @api.api_group, name: @api.name, request_type: @api.request_type, url: @api.url, version: @api.version }
      assert_redirected_to api_path(assigns(:api))
    end
  
    test "should destroy api" do
      assert_difference('Api.count', -1) do
        delete :destroy, id: @api
      end
  
      assert_redirected_to apis_path
    end
  end
end
