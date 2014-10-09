module ApplicationHelper
  def smartnav
    links = ''
    if @current_user.try(:is_admin)
      links += "<li>" + link_to('View Users', users_path) + "</li>"
    end

    if @current_user.present?

       links += "<li>"
       links += link_to('Calendar For ' + @current_user.username, events_path(date: @date, :region => 'New South Wales'))
       links += "</li>"

       links += "<li>"
       links += link_to('Event List', events_lists_path)
       links += "</li>"

       links += "<li>"
       links += link_to('New Events', new_event_path)
       links += "</li>"

       links += "<li>"
       links += link_to('My Account', user_show_path)
       links += "</li>"

       links += "<li>"
       links += link_to('Logout ' +  @current_user.username, login_path, :data => {:method => :delete, :confirm => 'Really logout?'})
       links += "</li>"

    else
      links += "<li>#{ link_to('Sign up', new_user_path) }</li>"
      links += "<li>#{ link_to('Sign in', login_path) }</li>"
    end

    links
  end
end
