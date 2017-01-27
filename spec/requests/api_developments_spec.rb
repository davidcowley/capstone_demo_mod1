require 'rails_helper'

RSpec.describe "ApiDevelopments", type: :request do
 
  def parsed_body
    JSON.parse(response.body)
  end

  describe "RDBMS-backed" do
  	before(:each){City.delete_all}
   	after(:each){City.delete_all}
 	
  	it "create RDBMS-backed model" do
      city_object=City.create(:name=>"Montague")
      expect(City.find(city_object.id).name).to eq("Montague")
  	end
  	it "expose RDBMS-backed API resource" do
     city_object=City.create(:name=>"Montague")
     expect(cities_path).to eq("/api/cities")
     get city_path(city_object.id)
     expect(response).to have_http_status(:ok)
     expect(parsed_body["name"]).to eq("Montague")
  	end
  end


  describe "MongoDB-backed" do
 	  before(:each){State.delete_all}
   	after(:each){State.delete_all}

   	it "create MongoDB-backed model" do
      state_object=State.create(:name=>"California")
      expect(State.find(state_object.id).name).to eq("California")
   	end

  	it "expose MongoDB-backed API resource" do 
      state_object=State.create(:name=>"California")
      expect(states_path).to eq("/api/states")
      get state_path(state_object.id)
      expect(response).to have_http_status(:ok)
      expect(parsed_body["name"]).to eq("California")
      expect(parsed_body).to include("created_at")
      expect(parsed_body).to include("id"=>state_object.id.to_s)
 	  end
  end

end
