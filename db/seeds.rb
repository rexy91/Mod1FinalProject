Song.destroy_all
User.destroy_all

# Need to access user1,2 by caling User.all.first/last/position.
#in order to access instances use Class and it's methods.
user1 = User.create(username: 'saima'.downcase)
user2 = User.create(username: 'rex'.downcase)

# song1 = Song.create(songname: 'You Are Beautiful',artist:'James',mood:'Chill',url:'https://www.youtube.com/watch?v=oofSnsGkops',duration:'3:22')

# Excited:
song1 = Song.create(songname: 'South Side',artist:'DjSnake',mood:'Excited',url:'https://www.youtube.com/watch?v=43NIgVtixmc',duration:'26')
song2 = Song.create(songname: 'Beautiful Now',artist:'Zedd',mood:'Excited',url:'https://www.youtube.com/watch?v=n1a7o44WxNo',duration:'27')
# song3 = Song.create(songname: 'Dream On',artist:'Aerosmith',mood:'Excited',url:'https://www.youtube.com/watch?v=sZfZ8uWaOFI',duration:'4:42')

# Happy:

song3 = Song.create(songname:'Stay', artist: 'Zedd', mood: 'Happy', url: 'https://www.youtube.com/watch?v=yWEK4v9AVKQ', duration: '25')
song4 = Song.create(songname:'Together', artist: 'Martin Garrix', mood: 'Happy', url: 'https://www.youtube.com/watch?v=uA51eLELZqE&list=PLt8fcdovyojFGzjfDdtv70JK8CPqHiDZn&index=3', duration: '30')

# Chill:
song5 = Song.create(songname: 'Lost',artist:'Illenium',mood:'Chill',url:'https://www.youtube.com/watch?v=5dJG_DdOuOM',duration:'28')
song6 = Song.create(songname: 'Let You Go',artist:'Illenium',mood:'Sad',url:'https://www.youtube.com/watch?v=oofSnsGkops',duration:'30')



# song6 = Song.create(songname: 'Lost',artist:'Illenium',mood:'Chill',url:'https://www.youtube.com/watch?v=5dJG_DdOuOM',duration:'3:15')
# song7 = Song.create(songname: "Can't Stop The Feeling",artist:'Justin Timberlake',mood:'Happy',url:'https://www.youtube.com/watch?v=ru0K8uYEZWw&list=PLW9z2i0xwq0F3-8LieqflLLWLWZQgvhEX',duration:'4:45')
# song8 = Song.create(songname: 'Takeaway',artist:'Illenium',mood:'Happy',url:'https://www.youtube.com/watch?v=lzkKzZmRZk8&list=PLt8fcdovyojFGzjfDdtv70JK8CPqHiDZn&index=2',duration:'3:48')
# song9 = Song.create(songname: 'No Body Compares to You', artist: 'Gryffin', mood: 'Chill', url:"https://www.youtube.com/watch?v=QjihRb2E-YA", duration: '20')
# song10 = Song.create(songname: 'Quiet Storm',artist:'Zomboy',mood:'Excited',url:'https://www.youtube.com/watch?v=mFrsPePOjn4',duration:'3:45')


# Below hasn;t been seeded? 
# song11 = Song.create(songname: 'Miss atomic bomb',artist:'The Killers',mood:'romantic',url:'https://www.youtube.com/watch?v=oofSnsGkops',duration:'3:22')
# song12 = Song.create(songname: 'wake me up when september ends', artist:'Greenday', mood:'chill',url:'https://www.youtube.com/watch?v=43NIgVtixmc',duration:'3:22')
# song13 = Song.create(songname: 'November Rain',artist:'Guns & Roses',mood:'sad',url:'https://www.youtube.com/watch?v=sZfZ8uWaOFI',duration:'3:22')
# song14 = Song.create(songname: 'Happy',artist:'Pharrell Williams',mood:'Happy',url:'https://www.youtube.com/watch?v=QQcQDbpDH_o',duration:'3:22')
# song15 = Song.create(songname: 'Memories',artist:'Maroon 5',mood:'excited',url:'https://www.youtube.com/watch?v=oofSnsGkops',duration:'3:22')
# song16 = Song.create(songname: 'Cant take my eyes of you', artist:'Frankie Valli', mood:'romantic',url:'https://www.youtube.com/watch?v=oofSnsGkops',duration:'3:22')
# song17 = Song.create(songname: 'Lover',artist:'taylor swift',mood:'sad',url:'https://www.youtube.com/watch?v=43NIgVtixmc',duration:'3:22')
# song18 = Song.create(songname: 'Only Human',artist:'Jonas Brothers',mood:'chill',url:'https://www.youtube.com/watch?v=sZfZ8uWaOFI',duration:'3:22')
# song19 = Song.create(songname: 'Beautiful People',artist:'Ed Sheeran Featuring Khalid',mood:'excited',url:'https://www.youtube.com/watch?v=QQcQDbpDH_o',duration:'3:22')
# song20 = Song.create(songname: 'baby',artist:'Justin Beiber',mood:'happy',url:'https://www.youtube.com/watch?v=oofSnsGkops',duration:'3:22')
# song21 = Song.create(songname:'Stay', artist: 'Zedd', mood: 'Happy', url: 'https://www.youtube.com/watch?v=yWEK4v9AVKQ', duration: '25')

