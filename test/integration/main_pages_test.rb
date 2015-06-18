require 'test_helper'

class MainPagesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test "should have links" do
    get root_path
    assert_template 'main_pages/home'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", o_nas_path, count = 2
    assert_select "a[href=?]", kontakt_path
    assert_select "a[href=?]", pomoc_path
  end
end
