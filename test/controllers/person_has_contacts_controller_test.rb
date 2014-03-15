require 'test_helper'

class PersonHasContactsControllerTest < ActionController::TestCase
  setup do
    @person_has_contact = person_has_contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:person_has_contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create person_has_contact" do
    assert_difference('PersonHasContact.count') do
      post :create, person_has_contact: { contact: @person_has_contact.contact, person: @person_has_contact.person }
    end

    assert_redirected_to person_has_contact_path(assigns(:person_has_contact))
  end

  test "should show person_has_contact" do
    get :show, id: @person_has_contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person_has_contact
    assert_response :success
  end

  test "should update person_has_contact" do
    patch :update, id: @person_has_contact, person_has_contact: { contact: @person_has_contact.contact, person: @person_has_contact.person }
    assert_redirected_to person_has_contact_path(assigns(:person_has_contact))
  end

  test "should destroy person_has_contact" do
    assert_difference('PersonHasContact.count', -1) do
      delete :destroy, id: @person_has_contact
    end

    assert_redirected_to person_has_contacts_path
  end
end
