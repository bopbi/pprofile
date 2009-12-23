require 'test_helper'

class ConfigurationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Configuration.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Configuration.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Configuration.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to configuration_url(assigns(:configuration))
  end
  
  def test_edit
    get :edit, :id => Configuration.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Configuration.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Configuration.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Configuration.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Configuration.first
    assert_redirected_to configuration_url(assigns(:configuration))
  end
  
  def test_destroy
    configuration = Configuration.first
    delete :destroy, :id => configuration
    assert_redirected_to configurations_url
    assert !Configuration.exists?(configuration.id)
  end
end
