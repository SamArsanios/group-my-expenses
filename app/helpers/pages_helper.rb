module PagesHelper
    def navbar_dropdown_items
        result = ''
        if current_user
          result << (link_to 'Main page', root_path, class: 'dropdown-item')
          result << (link_to 'Sign out', logout_path, method: :delete, class: 'dropdown-item')
        else
          result << (link_to 'Sign in', login_path, class: 'dropdown-item')
          result << (link_to 'Sign up', signup_path, class: 'dropdown-item')
        end
        result.html_safe
      end
    
end
