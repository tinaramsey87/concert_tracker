require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @bands = Band.all

  erb(:index)
end

post('/bands') do
  band_name = params["band"]
  @band = Band.create({ :name => band_name })

  redirect back
end

post('/venues') do
  venue_name = params["venue"]
  @venue = Venue.create({ :name => venue_name })

  redirect ('/')
end

get('/bands/:id') do
  @band = Band.find(params["id"])
  @venues = @band.venues

  erb(:band_page)
end

post('/band_venues/:id') do
  @params = params
  @venues = []
  venue_ids = params["venue_ids"]
  venue_ids.each do |id|
    @venues.push(Venue.find(id.to_i))
  end
  @band = Band.find(params["id"])
  @band.venues << @venues

  erb(:band_page)
end

get('/bands/:id/edit') do
  @band = Band.find(params["id"])
  @venues = Venue.all

  erb(:band_edit_page)
end

patch('/bands/:id') do
  @band = Band.find(params["id"])
  new_band_name = params["new_name"]
  @band.update({ :name => new_band_name })
  @venues = @band.venues

  erb(:band_page)
end
