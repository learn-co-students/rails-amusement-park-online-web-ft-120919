rails g model Author name:string genre:string bio:text --no-test-framework

rails g model Attraction name:string tickets:integer nausea_rating:integer happiness_rating:integer min_height:integer --no-test-framework

User.create(
      :name => "Mindy",
      :password => "password",
      :nausea => 5,
      :happiness => 3,
      :tickets => 4,
      :height => 34
    )

rails g model User name:string password:string nausea:integer happiness:integer tickets:integer height:integer --no-test-framework

rails g model Rides user_id:integer attraction_id:integer --no-test-framework 

rails g migration add_published_status_to_posts published_status:string --no-test-framework

rails g migration add_admin_to_users admin:boolean --no-test-framework

<%= form_tag ({controller: 'sessions', action: 'destroy', method: 'post'}) do %>
  <input type=submit value='logout'>
<% end %>