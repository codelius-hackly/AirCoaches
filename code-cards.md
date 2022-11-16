
delete after using:
needs to implement pictures as well:
height width???

    <% @coaching_offers.each do |offer| %>
      <%= link_to coaching_offer_path(offer) do %>
        <div class="card-trip">
              <img src="https://img.freepik.com/free-vector/matrix-style-binary-code-digital-background-with-falling-numbers_1017-25336.jpg" />
              <div class="card-trip-infos">
                <div>
                  <h2><%= offer.title %></h2>
                  <p><%= offer.description %></p>
                </div>
                <h2 class="card-trip-pricing"> $<%= offer.price %>/h</h2>
                <%= cl_image_tag offer.user.profile_pic.key, height: 300, width: 400, crop: :fill, class: "card-trip-user avatar-bordered" %>
              </div>
            </div>
      <% end %>
    <% end %>
