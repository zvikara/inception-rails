class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def photos
    @access_token = current_user.authentications.first.token
    @graph = Koala::Facebook::API.new(@access_token)
    @photos = @graph.fql_query("SELECT src_big,caption FROM photo WHERE owner = me() OR owner IN (SELECT uid2 FROM friend WHERE uid1 = me() LIMIT 8) LIMIT 100")
  end
end
