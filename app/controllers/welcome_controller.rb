class WelcomeController < ApplicationController
  
  def index
  
  #Passing variable introduced by the user in mod1
  #user_entry_module1 = params[:user_entry_module1]

  end  

  def get_data 
    #From json to hash - consumption_profile_generic 
     file_path = Rails.root.join('db','consumption_profile_generic_some_columns.js')  
     file_gen = File.read(file_path) 
     data_hash_gen = JSON.parse(file_gen) 
     
    
  # Filtering date and consumption_% ind 2 vectors and then merging them
  num = data_hash_gen.count 
  vectorA = Array.new
  vectorB = Array.new
  i = 0
  while num > i
    vectorA[i] = data_hash_gen[i]["consumption_%"].to_f  
    vectorB[i] = data_hash_gen[i]["date"]
    i += 1
  end
  #@vectorB = [1,2,3,4] 
  data = vectorB.zip(vectorA)
    #file_path = Rails.root.join('db','data.js') 
    #@raw_data = File.read(file_path) 
    #data = JSON.parse(@raw_data) 
    #data = [["1.januar",12],["1.januar",5],["1.januar",18],["1.januar",13],["1.januar",7],["1.januar",4],["1.januar",9],["1.januar",10],["1.januar",15],["1.januar",22]]
    #data = [["1.Januar",5.6794e-05],["1.Januar",5.34456e-05],["1.Januar",5.10494e-05],["1.Januar",5.10282e-05]] 
    #a = [2.34e-06,2.54e-05,3.34e-05]
    #b = ["1.Januar","1.Januar","1.Januar"]
    #data = b.zip(a)
    #puts data.inspect 
    #puts data.class
    factor = params[:factor].to_i 
    data = data.map{|i| [i[0], i[1] * factor]} 
    #puts data.inspect 
  render json: data

  end 

  
end
