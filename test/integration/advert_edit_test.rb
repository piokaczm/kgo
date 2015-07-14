require 'test_helper'

class AdvertEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = users(:piotr)
    @user2 = users(:cyc)
    @advert = Advert.create!(     title: "cyce",
                              category: "inne",
                              content: "asdlfkjfd lkjsdf lkjsdf",
                              price: 234,
                              user_id: 1,
                              new: true,
                              city: @user.city,
                              wojewodztwo: @user.wojewodztwo,
                              id: 1,
                              picture: fixture_file_upload('/files/image.jpg', 'image/jpg'))
  end
  
  test "successful edit" do
    login_as(@user)
    assert_difference 'Advert.count', 1 do
      post_via_redirect adverts_path, advert: {
                                            title: "picza",
                                            category: "inne",
                                            content: "asdlfkjfd lkjsdf lkjsdf",
                                            price: 234,
                                            user_id: 1,
                                            new: true,
                                            city: @user.city,
                                            wojewodztwo: @user.wojewodztwo,
                                            picture: fixture_file_upload('/files/image.jpg', 'image/jpg')}
    end    
    get edit_advert_path(@advert)
    assert_template 'adverts/edit'
    patch advert_path(@advert), advert: { 
                                          title: "picza",
                                          category: "inne",
                                          content: "asdlfkjfd lkjsdf lkjsdf",
                                          price: 234,
                                          user_id: 1,
                                          new: true,
                                          city: @user.city,
                                          wojewodztwo: @user.wojewodztwo,
                                          picture: fixture_file_upload('/files/image.jpg', 'image/jpg')}
    assert_redirected_to @advert
    follow_redirect!
    assert_not flash.empty?
    @advert.reload
    assert_equal "picza", @advert.title
  end
  
  test "unsuccessful edit" do
    get edit_advert_path(@advert)
    assert_redirected_to login_path
    assert_not flash.empty?
    login_as(@user2)
    get edit_advert_path(@advert)
    assert_redirected_to root_path
    assert_not flash.empty?
  end
    
end
