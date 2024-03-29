require 'spec_helper'

describe "LayoutLinks" do
  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "home")
  end
  
  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "contact")
  end
  
  it "should have a About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "about")
  end
  
  it "should have a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "help")
  end
  
  it "should have a signup page at '/signup'" do
    get '/signup'
    response.should have_selector('title',:content => "sign up")
  end
  it "should have the right links on layout" do 
    visit root_path
    response.should have_selector('title', :content => "home")
    click_link "about"
    response.should have_selector('title', :content => "about")
    click_link "contact"
    response.should have_selector('title', :content => "contact")
    click_link "home"
    response.should have_selector('title', :content => "home")
    click_link "Sign up now!"
    response.should have_selector('title', :content => "sign up")
    response.should have_selector('href[href="/"]>img')
  end
end
