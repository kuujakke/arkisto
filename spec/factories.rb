FactoryGirl.define do
  factory :picture do
    file "1489500739386.jpg"
    source_url "https://www.asd.net/foo/bar"
  end
  factory :picture_jpeg, class: Picture do
    file "1489500739386.jpg"
    source_url "https://www.asd.net/foo/bar"
  end
<<<<<<< HEAD
  factory :picture_png, class: Picture do
    file "1489500739386.png"
    source_url "https://www.asd.net/foo/bar"
  end
  factory :picture_webp, class: Picture do
=======
  factory :image_png, class: Image do
    file "1489500739386.png"
    source_url "https://www.asd.net/foo/bar"
  end
  factory :image_webp, class: Image do
>>>>>>> master
    file "1489500739386.webp"
    source_url "https://www.asd.net/foo/bar"
  end
end