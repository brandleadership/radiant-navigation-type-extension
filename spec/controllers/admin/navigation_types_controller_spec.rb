require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::NavigationTypesController do

  dataset :users
  
  before :each do
    login_as :existing
  end

  it "index should response and render the index template" do
    get :index
    response.should be_success
    response.should render_template(:index)
    assigns[:navigationTypes].should be_instance_of(Array)
  end

  it "new should response and render the new template" do
    get :new
    response.should be_success
    response.should render_template(:new)
  end

  it "create" do
    get :create, :name => 'test'
    response.should render_template(:index)
  end
end