

<%= form_tag(edit_attraction_path, method: 'get') do %>
     <%= submit_tag("Edit Attraction")%>
<% end %>

<%= link_to "Edit Attraction", edit_attraction_path(@attraction) %>