require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = User.new(username: "kaczmuch", name: "Piotr", email: "piokaczm@gmail.com", city: "Tychy", wojewodztwo: "Śląskie", password: "foobar", password_confirmation: "foobar")
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "username should be present" do
    @user.username = "  "
    assert_not @user.valid?
  end
  
  test "name should be present" do
    @user.name = "  "
    assert_not @user.valid?
  end
    
  test "email should be present" do
    @user.email = "  "
    assert_not @user.valid?
  end
    
  test "city should be present" do
    @user.city = "  "
    assert_not @user.valid?
  end
  
  test "wojewodztwo should be present" do
    @user.wojewodztwo = " "
    assert_not @user.valid?
  end
  
  test "password should be present" do
    @user.password = @user.password_confirmation = "  "
    assert_not @user.valid?
  end
  
  test "username shouldn't be too long" do
    @user.username = "a" * 21
    assert_not @user.valid?
  end
  
  test "password should have valid length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
  
  test "password should be confirmed" do
    @user.password_confirmation = "foobal"
    assert_not @user.valid?
  end
  
  test "password should be case sensitive" do
    @user.password = "foobar"
    @user.password_confirmation = "fOobar"
    assert_not @user.valid?
  end
  
  test "email should have valid format" do
    
     valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?
    end
    
    invalid_addresses.each do |address|
      @user.email = address
      assert_not @user.valid?
    end
    
  end
  
  test "email should be unique" do
    user_dup = @user.dup
    @user.save
    user_dup.username = "cipsko"
    user_dup.email = @user.email.upcase
    assert_not user_dup.valid?
  end
  
  test "username should be unique" do
    user_dup = @user.dup
    @user.save
    user_dup.email = "ppapa@papa.com"
    user_dup.username = @user.username.upcase
    assert_not user_dup.valid?
  end
  
  test "email should be downcase before save" do
    invalid_email = "fOOF@gmail.coM"
    @user.email = invalid_email
    @user.save
    assert_equal invalid_email.downcase, @user.reload.email
  end
  
  test "adverts should be deleted aongside with user" do
    @user.save
    @user.adverts.create!(title: "Cipka", content: "sdlkfjsd sfoisdf lksdjf", price: 119.99, wojewodztwo: @user.wojewodztwo, new: true, size1: 52, size2: 53.5)
    assert_difference 'Advert.count', -1 do
      @user.destroy
    end
  end
    
end
