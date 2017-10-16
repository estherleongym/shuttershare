module PhotosHelper

  def feed_photos

    @user = current_user
    @feed_photos = []
      if !(@user.photos.empty?)
        @user.photos.all.each do | my_photo |
          @feed_photos << my_photo
        end
        @feed_photos
      end

      # if @user.followers.photos == !(nil)
      #   @followers_photos = @user.followers.photos
      #     @followers_photos.all.each do | followers_photo |
      #       @feed_photos << followers_photo
      #     end
      #     @feed_photos
      # end
    return @feed_photos
  end

end
