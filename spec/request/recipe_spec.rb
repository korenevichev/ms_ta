require 'rails_helper'

describe 'RecipesController', :vcr, type: :request do
  it "GET index" do
    get '/recipes'
    expect(response.status).to eq(200)
    expect(response).to render_template('index')
  end

  it "GET show" do
    get '/recipes/4dT8tcb6ukGSIg2YyuGEOm'
    expect(response.status).to eq(200)
    expect(response).to render_template('show')
  end

  it "GET show wrong id" do
    get '/recipes/123'
    expect(response.status).to eq(404)
    expect(response).to render_template('not_found')
  end
end