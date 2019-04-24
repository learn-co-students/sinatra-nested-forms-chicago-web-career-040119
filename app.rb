require './environment'

module FormsLab
 class App < Sinatra::Base

    get '/' do
      erb :'root'
  end
#we are serving pirate and ships form to the browser
    get '/new' do
      erb :'pirates/new'
   end
#process the input from the user and display the pirate and the ships
#we process a FORM with POST to the route '/pirates'
    post '/pirates' do
#we create a new Pirate using info stored in params[:pirate], wich contains the pirate name, weight, height
    @pirate = Pirate.new(params[:pirate])
#we iterate over params[:pirate][:ships], which is an array containing a series of hashes that each store individual info
    params[:pirate][:ships].each do |details|
#during the iteration process, we use the ships values passed into the .each block to create instances of our Ship class
      Ship.new(details)
    end
#we store our instantiates ships in the instance variable @ships, making the ships info available within our view, 'pirates/show'.erb
    @ships = Ship.all

    erb :'pirates/show'
  end

 end
end









# NOTES:
# GET '/new'
#     renders a new form element on the page
#     renders the pirate input fields for name, weight, and height attributes on the page
#     renders the first ship's input fields for the name, type, and booty attributes on the page
#     renders the second ship's input field for the name, type, and booty attributes on the page
# POST '/pirates'
#     displays the pirate information upon form submission
#     displays the first ship's information upon form submission
#     displays the second ship's information upon form submission
