module Helpers

    def get_token
        
        3.times do
            js_script = 'return window.localStorage.getItem("default_auth_token");'
            page.execute_script(js_script)
            break if @token != nil
            sleep 2
        end  
        
        @token
        
    end

end