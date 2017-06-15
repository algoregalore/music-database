namespace :db do

  desc "Clear the Artist and Song tables and fill with excellent sample data"

  task populate: :environment do    require 'faker'

    # Clear out the old junk
    [Artist, Song].each { |i| i.destroy_all }

    # Add genres, artists, and songs
    Genre.all.each do |genre|

        5..10.times do
        artist = Artist.create(name: Faker::StarWars.vehicle, genre_id: genre.id)

        10..20.times do
          song = Song.create(name: Faker::Company.catch_phrase, artist_id: artist.id)
        end
      end
    end

    puts "BOOYA!  Done populating!"
  end
end