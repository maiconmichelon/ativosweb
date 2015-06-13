require 'test_helper'

class PurchaseRequestsControllerTest < ActionController::TestCase
  setup do
    @purchase_request = purchase_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchase_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase_request" do
    assert_difference('PurchaseRequest.count') do
      post :create, purchase_request: { approval_responsible_id: @purchase_request.approval_responsible_id, description: @purchase_request.description, responsible_id: @purchase_request.responsible_id, status: @purchase_request.status, title: @purchase_request.title }
    end

    assert_redirected_to purchase_request_path(assigns(:purchase_request))
  end

  test "should show purchase_request" do
    get :show, id: @purchase_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purchase_request
    assert_response :success
  end

  test "should update purchase_request" do
    patch :update, id: @purchase_request, purchase_request: { approval_responsible_id: @purchase_request.approval_responsible_id, description: @purchase_request.description, responsible_id: @purchase_request.responsible_id, status: @purchase_request.status, title: @purchase_request.title }
    assert_redirected_to purchase_request_path(assigns(:purchase_request))
  end

  test "should destroy purchase_request" do
    assert_difference('PurchaseRequest.count', -1) do
      delete :destroy, id: @purchase_request
    end

    assert_redirected_to purchase_requests_path
  end
end
