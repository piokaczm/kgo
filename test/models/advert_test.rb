require 'test_helper'

class AdvertTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:piotr)
    @advert = @user.adverts.create!(title: "Cipka", content: "sdlkfjsd sfoisdf lksdjf", price: 119.99, wojewodztwo: @user.wojewodztwo, city: "tyszky", new: true, size1: 52, size2: 53.5, category: "kierownice")
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
  
  
  test "city should be present" do
    @advert.city = " "
    assert_not @advert.valid?
  end
  
  test "category shoud be present and within self.types" do
    @advert.category = " "
    assert_not @advert.valid?
    @advert.category = "Majtki"
    assert_not @advert.valid?
  end
  
  test "size 2 doesn't need to be present in certain cases" do
    @advert.category = "korby"
    @advert.size2 = nil
    assert @advert.valid?
    @advert.category = "koła"
    @advert.size2 = nil
    assert @advert.valid?
  end
  
  test "both sizes aren't needed in certain cases" do
    @advert.category = "inne"
    @advert.size1 = nil
    @advert.size2 = nil
    assert @advert.valid?
    @advert.category = "siodła"
    @advert.size1 = nil
    @advert.size2 = nil
    assert @advert.valid?
  end
  
end
