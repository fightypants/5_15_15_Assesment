require("bundler/setup")
Bundler.require(:default, :production)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
@bands = Band.all
erb(:index)
end

post('/bands') do
  @for_bands = true
  name = params.fetch('name')
  @bands = Band.create({:name => name})
  if @bands.save
    redirect to('/')
  else
    erb(:errors)
  end
end

get('/bands/:id') do
  @band = Band.find(params.fetch('id').to_i)
  erb(:band)
end

delete('/bands/:id') do
  @band = Band.find(params.fetch('id').to_i)
  @band.delete
  redirect to ('/')
end

get('/bands/:band_id/venues/new') do
  @band = Band.find(params.fetch('band_id').to_i)
  erb(:venue_form)
end

post('/bands/:band_id/venues') do
  @band = Band.find(params.fetch('band_id').to_i)
  name = params.fetch('name')
  @venue = @band.venues.create({:name => name})
    if @venue.save
      redirect("/bands/#{@band.id}")
    else
      erb(:errors)
  end
end

get('/venues')do
  @venues = Venue.all
  erb(:venue)
end

post('/venues')do
  @for_venues = true
  name = params.fetch('name')
  @venue = Venue.create({:name => name})
  if @venue.save
    redirect to('/venues')
  else
    erb(:errors)
  end
end
