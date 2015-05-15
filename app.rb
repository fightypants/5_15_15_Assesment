require("bundler/setup")
Bundler.require(:default, :production)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
@bands = Band.all
erb(:index)
end

post('/bands') do
  name = params.fetch('name')
  @bands = Band.create({:name => name})
  if @bands.save
    redirect to('/')
  else
    erb(:errors)
  end
end
