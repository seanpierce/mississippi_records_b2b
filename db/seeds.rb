class Seed

  def self.begin
    seed = Seed.new
    seed.createAlbums
    p "Created #{Album.count} Albums"
  end

  def images

  end

  def createAlbums
    20.times do
      Album.create!(
        artist: Faker::Book.author,
        title: Faker::Book.title,
        catalog: "MR #{rand(0..9)}#{rand(0..9)}#{rand(0..9)}",
        category: "mrecs",
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
        audio: "audio/deadmoon-dontburnthefires-graveyard.mp3"
      )
    end
  end

end

Seed.begin
