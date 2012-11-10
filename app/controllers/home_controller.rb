class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def photos
    @access_token = current_user.authentications.first.token
    @graph = Koala::Facebook::API.new(@access_token)
    #@feed = nil # @graph.get_connections('me', 'feed').first
    #@friends = nil # @graph.get_connections("me", "friends")
    # friends.each do |f|
    #   f[:image]= @graph.get_picture(f["id"])
    # end
    #@albums = @graph.get_connections("me", "albums")
    #@photos = @graph.get_connections("me", "photos")
    @photos = @graph.fql_query("SELECT src_big FROM photo WHERE owner = me() OR owner IN (SELECT uid2 FROM friend WHERE uid1 = me() LIMIT 8) LIMIT 100")
    #@photos = @graph.fql_query("SELECT src FROM photo_src WHERE height = '180' AND photo_id = (SELECT pid FROM photo WHERE owner = me() OR owner IN (SELECT uid2 FROM friend WHERE uid1 = me() LIMIT 5) LIMIT 80)")
  end
end
