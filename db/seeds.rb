class Seed

  def self.begin
    seed = Seed.new
    seed.createAlbums
    seed.createUsers
    p "Created #{Album.count} Albums"
    p "Created #{User.count} Users"
  end

  def images

  end

  def createAlbums
    60.times do
      Album.create!(
        artist: Faker::Book.author,
        title: Faker::Book.title,
        catalog: "MR #{rand(0..9)}#{rand(0..9)}#{rand(0..9)}",
        category: ["mrecs", "distro"].sample,
        description: Faker::Lorem.paragraph(2),
        price: rand(10..40),
        image: [
          "http://mississippirecords.store/images/blindowlwilson-st.jpg",
          "http://mississippirecords.store/images/blindunclegaspardanddelmalachney-onthewatersedge.jpg",
          "http://mississippirecords.store/images/deadmoon-inthegraveyard.jpg",
          "http://mississippirecords.store/images/eurekabrassband-dirges.jpg",
          "http://mississippirecords.store/images/emahoytsegue-mariamguebrust.jpg",
          "http://mississippirecords.store/images/michaelhurley-hifisnockuptown.jpg",
          "http://mississippirecords.store/images/kleenexlilliput-firstsongs.jpg",
          "http://mississippirecords.store/images/isaiahowens-youwithoutsincastthefirststone.jpg",
          "http://mississippirecords.store/images/uralthomasandthepain-st-lp.jpg",
          "http://mississippirecords.store/images/spacelady-greatesthits.jpg"
        ].sample,
        audio: "http://mississippirecords.store/audio/deadmoon-dontburnthefires-graveyard.mp3"
      )
    end
  end

  def createUsers
    User.create!(
      username: 'admin',
      admin: true,
      email: 'admin@admin.com',
      password: '1234567',
      password_confirmation: '1234567'
    )

    User.create!(
      username: 'user',
      admin: false,
      email: 'user@user.com',
      password: '1234567',
      password_confirmation: '1234567'
    )
  end

end

Seed.begin
