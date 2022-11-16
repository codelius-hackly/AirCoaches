
delete after using:
needs to implement pictures as well:
height width???

<%= link_to coaching_offer_path(@coaching_offer) do %>
<% @coaching_offers.each do |offer| %>
  <%= render offer %>
  <div class="card-trip">
        <img src="https://img.freepik.com/free-vector/matrix-style-binary-code-digital-background-with-falling-numbers_1017-25336.jpg" />
        <div class="card-trip-infos">
          <div>
            <h2><%= @coaching_offer.title %></h2>
            <p><%= @coaching_offer.description %></p>
          </div>
          <h2 class="card-trip-pricing"> $<%= @coaching_offer.price %>/h</h2>
          <%= cl_image_tag @coaching_offer.user.profile_pic.photo.key, height: 300, width: 400, crop: :fill, class: "card-trip-user avatar-bordered" %>
        </div>
      </div>
 <% end %>
<% end %>
