include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :picture do
    file { fixture_file_upload(Rails.root.join('spec', 'pictures', 'test.jpg'), 'image/jpg') }
  end
  factory :picture_jpeg, class: Picture do
    file { fixture_file_upload(Rails.root.join('spec', 'pictures', 'test.jpeg'), 'image/jpeg') }
    source_url "https://www.asd.net/foo/bar"
  end
  factory :picture_png, class: Picture do
    file { fixture_file_upload(Rails.root.join('spec', 'pictures', 'test.png'), 'image/png') }
    source_url "https://www.asd.net/foo/bar"
  end
  factory :picture_webp, class: Picture do
    file { fixture_file_upload(Rails.root.join('spec', 'pictures', 'test.webp'), 'image/webp') }
    source_url "https://www.asd.net/foo/bar"
  end
  factory :picture_gif, class: Picture do
    file { fixture_file_upload(Rails.root.join('spec', 'pictures', 'test.gif'), 'image/gif') }
    source_url "https://www.asd.net/foo/bar"
  end
  factory :user, class: User do
    email "user@example.com"
    password "password"
    password_confirmation "password"
  end
  factory :moderator, class: User do
    email "admin@example.com"
    password "password"
    password_confirmation "password"
    moderator true
  end
end
