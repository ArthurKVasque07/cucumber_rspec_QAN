class SideBarView
    include Capybara::DSL

    def logged_user
        user = find(".sidebar-wrapper .user .info span").text 
    end
end