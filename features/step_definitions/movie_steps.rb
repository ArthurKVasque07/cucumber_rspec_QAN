Given('que {string} é um novo filme') do |movie_code|
    file = YAML.load_file(File.join(Dir.pwd, 'features/support/fixtures/movies.yaml'))
    @movie = file[movie_code]
    Database.new.delete_movie(@movie["title"])
end

Given('este filme já existe no catálogo') do
    Database.new.insert_movie(@movie)  
end
  
When('eu faço o cadastro deste filme') do
    @movie_page.add
    @movie_page.form.create(@movie)    
end
  
Then('devo ver o novo filme na lista') do
    result = @movie_page.movie_tr(@movie["title"])  
    expect(result).to have_text @movie["title"]
    expect(result).to have_text @movie["status"]
end 

Then('devo ver a notificação {string}') do |expect_alert|
    expect(@movie_page.form.alert).to eql expect_alert
end

Given('que {string} está catálogo') do |movie_code|
    steps %{
        Given que "#{movie_code}" é um novo filme
        And este filme já existe no catálogo  
    } 
end
  
When('eu solicito a exclusão') do
    @movie_page.remove(@movie["title"])    
end
  
When('eu confirmo a solicitação') do
    @movie_page.sweet_alert.confirm
end
  
Then('este item deve ser removida do catálogo') do    
    expect(@movie_page.has_no_movie(@movie["title"])).to be true 
end

When('cancelo a solicitação') do
    @movie_page.sweet_alert.cancel
end
  
Then('este item deve permanecer no catálogo') do
    expect(@movie_page.has_movie(@movie["title"])).to be true
end