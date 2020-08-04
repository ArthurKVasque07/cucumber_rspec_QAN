class SweetAlert
    include Capybara::DSL

    def confirm
        find('.swal2-confirm').click
    end

    def cancel
        find('.swal2-cancel').click
    end  

end