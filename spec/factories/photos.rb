FactoryGirl.define do
  factory :photo do
    user_id "10"
    caption "Just food"
    photo "https://s3-ap-southeast-1.amazonaws.com/shuttershare/images/photo/photo/5/6.jpg"
  end

  factory :photo1, class: Photo do
    caption "Hokkien mee"
    remote_photo_url "https://s3-ap-southeast-1.amazonaws.com/shuttershare/images/photo/photo/1/IMG_2762.JPG"
  end
end
