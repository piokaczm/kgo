require 'test_helper'

class AdvertTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:piotr)
    @advert = @user.adverts.build(title: "Cipka", content: "sdlkfjsd sfoisdf lksdjf", price: 119.99, wojewodztwo: @user.wojewodztwo, new: true, size1: 52, size2: 53.5)
  end
  
  
  test "should be valid" do
    assert @advert.valid?
  end
  
  test "shouldn't be valid" do
    @advert.user_id = nil
    assert_not @advert.valid?
  end
  
  test "title chould be not longer than 150 chars and present" do
    @advert.title = "a" * 151
    assert_not @advert.valid?
    @advert.title = " "
    assert_not @advert.valid?
  end
  
  test "content should be not longer than 1000 chars and present" do
    @advert.content = "a" * 1001
    assert_not @advert.valid?
    @advert.content = " "
    assert_not @advert.valid?
  end
  
  test "price should be present and float" do
    @advert.price = "aaaa"
    assert_not @advert.valid?
    @advert.price = " "
    assert_not @advert.valid?
  end
  
  test "wojewodztwo should be present, same as user's and within WOJLIST" do
    @advert.wojewodztwo = "Pomorskie"
    assert @advert.valid?
    @advert.wojewodztwo = " "
    assert_not @advert.valid?
  end
  
  test "new should be presetnt" do
    @advert.new = nil
    assert_not @advert.valid?
    @advert.new = false
    assert @advert.valid?
  end
  
  test "size1 and size2 should be numeric" do
    @advert.size1 = 55.5
    assert_not @advert.valid?
    @advert.size1 = @advert.size2 = "kupa"
    assert_not @advert.valid?
    @advert.size1 = @advert.size2 = 55
    assert @advert.valid?
  end
  
  test "order should be from most to least recent" do
    assert_equal adverts(:one), Advert.first
  end

  
end
