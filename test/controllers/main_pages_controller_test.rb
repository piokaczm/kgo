require 'test_helper'

class MainPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "KGO | Koleżeńska Giełda Ostrokołowa"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Pomoc | KGO"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "O nas | KGO"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Kontakt | KGO"
  end
  
  test "should get terms" do
    get :terms
    assert_response :success
    assert_select "title", "Zasady Użytkowania | KGO"
  end
  
end
