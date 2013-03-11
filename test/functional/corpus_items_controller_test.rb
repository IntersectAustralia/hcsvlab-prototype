require 'test_helper'

class CorpusItemsControllerTest < ActionController::TestCase
  setup do
    @corpus_item = corpus_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:corpus_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create corpus_item" do
    assert_difference('CorpusItem.count') do
      post :create, corpus_item: { date: @corpus_item.date, title: @corpus_item.title }
    end

    assert_redirected_to corpus_item_path(assigns(:corpus_item))
  end

  test "should show corpus_item" do
    get :show, id: @corpus_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @corpus_item
    assert_response :success
  end

  test "should update corpus_item" do
    put :update, id: @corpus_item, corpus_item: { date: @corpus_item.date, title: @corpus_item.title }
    assert_redirected_to corpus_item_path(assigns(:corpus_item))
  end

  test "should destroy corpus_item" do
    assert_difference('CorpusItem.count', -1) do
      delete :destroy, id: @corpus_item
    end

    assert_redirected_to corpus_items_path
  end
end
