require 'test_helper'

class GroupPagesControllerTest < ActionController::TestCase
  setup do
    @group_page = group_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_page" do
    assert_difference('GroupPage.count') do
      post :create, group_page: {  }
    end

    assert_redirected_to group_page_path(assigns(:group_page))
  end

  test "should show group_page" do
    get :show, id: @group_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group_page
    assert_response :success
  end

  test "should update group_page" do
    patch :update, id: @group_page, group_page: {  }
    assert_redirected_to group_page_path(assigns(:group_page))
  end

  test "should destroy group_page" do
    assert_difference('GroupPage.count', -1) do
      delete :destroy, id: @group_page
    end

    assert_redirected_to group_pages_path
  end
end
