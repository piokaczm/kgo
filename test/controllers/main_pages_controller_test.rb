require 'test_helper'

class MainPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "KGO | Koleżeńska Giełda Ostrokołowa"
  end
  
  test "should get sites" do
    list = [[:help, "FAQ"], [:about, "O nas"], [:contact, "Kontakt"], [:terms, "Zasady Użytkowania"]]
    title_response(list)
  end

end