require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get "/" do
      erb :root
    end

# In order to serve the form in the browser, we need a GET request:
    get "/new" do
      erb :"pirates/new"
    end

    # And now we need a way to process the input from the user and to display the pirates and their SHIPS.
     # We process a form with a POST request:

     post "/pirates" do
       @pirate = Pirate.new(params[:pirate])

       params[:pirate][:ships].each do |details|
         Ship.new(details)
       end

       @ships = Ship.all
       erb :"pirates/show"
     end

  end
end
