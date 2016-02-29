module Amazon
  class SignInPage < Page

    def title_value
      "Amazon Sign In"
    end
    def page_mark
      layer.div(:class => 'a-section a-padding-medium auth-workflow')
    end


  end
  Pages.register_page(Amazon::SignInPage, :sign_in_page)
end
