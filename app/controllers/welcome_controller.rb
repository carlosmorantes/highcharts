class WelcomeController < ApplicationController
  def index
  


  end  

  def get_data 
    file_path = Rails.root.join('db','data.js') 
    @raw_data = File.read(file_path) 
    data = JSON.parse(@raw_data) 
    puts data.inspect 
    factor = params[:factor].to_i 
    data = data.map{|i| [i[0], i[1] * factor]} 
    puts data.inspect 
    render json: data.to_json 

  end 

  
end
