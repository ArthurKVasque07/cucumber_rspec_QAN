
When('eu faço login com {string} e {string}') do |email, password|    
    @login_page.go
    @login_page.with(email, password)     
  end
  
  Then('devo ser autenticado') do  
    sleep 5
    expect(get_token.length).to be 147
  end
  
  Then('devo ver {string} na área logada') do |expect_name|    
    expect(@sidebar.logged_user).to eql expect_name
  end

  Then('não devo ser autenticado') do    
    expect(get_token).to be nil
  end

  Then('devo ver a mensagem de alerta {string}') do |expect_message|    
    expect(@login_page.alert).to eql expect_message
    sleep 2
  end