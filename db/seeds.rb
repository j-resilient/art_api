# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

ApplicationRecord.connection.reset_pk_sequence!('users')
ApplicationRecord.connection.reset_pk_sequence!('artworks')
ApplicationRecord.connection.reset_pk_sequence!('artwork_shares')


rose = User.create({ username: 'rose' })
doctor = User.create({ username: 'doctor' })
martha = User.create({ username: 'martha' })
donna = User.create({ username: 'donna' })

art = Artwork.create([
    { title: 'Bad Wolf', image_url: 'badwolf.com', artist_id: rose.id },
    { title: 'TARDIS', image_url: 'tardis.com', artist_id: doctor.id }
])

shares = ArtworkShare.create([
    { artwork_id: Artwork.first.id, viewer_id: doctor.id },
    { artwork_id: Artwork.last.id, viewer_id: rose.id },
    { artwork_id: Artwork.last.id, viewer_id: martha.id },
    { artwork_id: Artwork.last.id, viewer_id: donna.id },
])