require 'test_helper'

class MainPagesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test "should have links" do
    get root_path
    assert_template 'main_pages/home'
    list = [root_path, o_nas_path, kontakt_path, [faq_path, 2], zasady_uzytkowania_path, login_path, rejestracja_path]
    links(list)
  end
end
