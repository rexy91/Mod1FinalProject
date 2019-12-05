require 'pry'
require "tty-prompt"
require 'colorize'
require 'colorized_string'

class MoodyTune
    attr_reader :user
    attr_accessor :prompt

    def initialize()
      @prompt = TTY::Prompt.new

  # This is just reading @user in this class.
  # here will be your CLI!
  # it is not an AR class so you need to add attr
    end

  def run
    # test
    # ask_mood_and_show_songs
    welcome
    login_signup
    show_favrouite_songs

    # get_joke(what_subject)
  end

  private # Only getting called inside this class.

  # def test
  #    prompt.select("Choose your destiny?", %w(Scorpion Kano Jax))
  # end
  def welcome
      puts "Welcome to MoodyTune!!! \nFull of music that will fit your mood.".colorize(:green)
      sleep(1)
      system "clear"
  end

  def login_signup
      puts 'What is your name?'.colorize(:green)
      username = gets.chomp.downcase
      sleep(1.5)
      system "clear"
      # we use @user so we can use this variable in other methods outside of this scope..
      @user = User.find_or_create_by(username: username.downcase)
      puts "Hello #{@user.username.capitalize} !!!!".colorize(:color => :white, :background => :red)
      sleep(2.5)
      system "clear"
  end

  def fav_songs_instances
        # This loops through the favsongs, and match favsong's user_id to @user.id(user class).
        fav_songs = Favsong.all.select do |favsong|
          # Returns favsong instances matching the user.
            favsong.user_id == @user.id
      end
  end

  def ask_mood_and_show_songs

    moods = ['Happy', 'Sad', 'Excited', 'Chill', 'Romantic']
    mood_choice = prompt.select("What is your mood today?",moods)
    matching_songs = Song.all.select do |each_song|
           each_song.mood.downcase == mood_choice.downcase
     end
    matching_songnames_artists =
        matching_songs.map do |song|
        # Returns song name and artist name.
        "#{song.songname} by #{song.artist}."
    end
    display_songs_and_choose(matching_songnames_artists)
end  # End of ask_mood_and_show_songs

def display_songs_and_choose(songs)
  # pastel = Pastel.new
  # font = TTY::Font.new
  # We initiazlied prompt, only need to do it once? 
  # prompt_save = TTY::Prompt.new
  # new_prompt = TTY::Prompt.new
  sleep(1)
  system "clear"
  song_choices = prompt.multi_select("Here are the songs matching your mood, please choose songs:",songs)
  system "clear"
  song_to_play = prompt.select("Which one do you want to listen to? ", song_choices)
  system "clear"
  # Call play music method, pass in the song to be played. 
  # play_music(song_to_play)
  # Call adding to favrouite list method. 
  add_to_fav_list(song_to_play)
  sleep(1)
  system "clear"
  update_list 
  # Call play music method.
  # AFter played, if yes 
        # Thern call add_to_fav_list
        # If no call update_list method (menu).


  # # Assign the song user played to be song_choice. (To be passed into adding fav list.)
  # song_to_play = choice.split(" by ").first 
  
  # pid = fork{ exec 'afplay', "musics/#{song_to_play}.mp3"}
  
  # # Display colored text while song is playing. 
  
  # sleep(1)
  # puts "Playing '#{song_to_play}' for you!!!".colorize(:yellow)
  # sleep(2)  
  # puts "\n"
  # puts pastel.on_red(font.write("Enjoy"))
  # sleep(2)
  # puts pastel.on_yellow(font.write("Your "))
  # sleep(2)
  # puts pastel.on_cyan(font.write("Music "))
  # sleep(2)
  # puts pastel.on_magenta(font.write("      !!!        "))

  # # Find duration of song, so we can pause terminal for that duration while song is playing:
  # song_choice_instance = Song.all.find do |song|
  #                         song.songname == song_to_play
  #                       end

  # # Get the duration attribute of the song and convert it to int.
  # song_duration = song_choice_instance.duration.to_i
  # # Sleep for less than the duration.
  # sleep(song_duration - 4 )
  # prompt_yes_no = prompt.select("Do you want to add the song to favourite list?", ["Yes", "No"])

  # ** Needs condition here, for adding song or no. 

  # song_to_play = song_to_play.split(" by ").first # To pull the songname only.
  # song_to_play = song_to_play.split('!') # To convert it into an arry.
   # Instead of passing in song_choices(which is more than one choice), we pass in the one use chose to play. 
                                # ** If chose two songs but only listend to one, will still add two to fav songs.
  
  #** Try to play the song_choice music.
end # End of method

def add_to_fav_list(song_to_play)
    # Need to only match the one the user listened to. 
    # Loop through songs, find it by the song that the user listened to. 
    # And then created an favsong instance by user_id and song_id. 

  song_to_play = song_to_play.split(' by ') # To seperate songname and artist. 
  song_to_play = song_to_play.first.split('!') # To convert it into an array in order to use each. 
  prompt_yes_no = prompt.select("Do you want to add the song to favourite list?", ["Yes", "No"])
    if prompt_yes_no.downcase == 'yes'.downcase 
        # sleep(1)
        # system "clear"
        song_to_play.each do |song|
          song_id = Song.find_by(songname:song_to_play).id 
              Favsong.create(user_id: @user.id, song_id: song_id)
             
          end 
      print_fav_songs
    else 

          sleep(1)
          system "clear"
          update_list   
          print_fav_songs
    end 
    
    puts "You have added your songs successfully!".colorize(:green)
    # print_fav_songs

end # End of method

def prompt_yes_no
  prompt_yes_no = prompt.select("Do you want to add the song to favourite list?", ["Yes", "No"])
    if prompt_yes_no.downcase == 'yes'.downcase 
      add_to_fav_list
      print_fav_songs
    else

    end

end 

def show_favrouite_songs
      fav_songs = fav_songs_instances
      
      puts 'Would you like to see your favourite songs?'.colorize(:green)
      input = gets.chomp
      sleep(1)
      system "clear"
      if input.downcase == 'yes' # and fav_songs is empty, puts 'no fav songs.'
        sleep(1)
        # If favrouite is empty , puts sorry message.
         if fav_songs.empty?
            puts "Sorry, your favourite list is empty. \n Lets add songs to the list.".colorize(:green)
            sleep(2.5)
            ask_mood_and_show_songs
         else
        # If favrouite list is not empty, puts fav songs.
        #prompt message "1. ADD SONGS 2. DELETE SONGS"
    
          puts 'Here are your favourite songs:'.colorize(:green)
          fav_songs.each_with_index do |favsong, i|
            puts " #{i + 1}. #{favsong.song.songname.colorize(:red)} by #{favsong.song.artist}"
            sleep(0.5)
          end # loop ends
            puts "\n"
            update_list
        end
      elsif input.downcase == 'no'
        ask_mood_and_show_songs
      else
          puts 'Invalid input, please enter Yes or No.'.colorize(:green)
          show_favrouite_songs
    end
end
def delete_song(song)

  Favsong.all.select do |fav_song|
    favsong.song.songname == song
  end
end #end of delete method

# Old version of update list method. 
#   def update_list
#     add_delete_prompt = TTY::Prompt.new
#     update_choice = add_delete_prompt.select("Would you like tp update your playlist?",["Add Songs", "Delete Songs", "Play From Favourite List", "Exit"])
    
#     if update_choice.downcase == "Add Songs".downcase
#       ask_mood_and_show_songs
#     elsif update_choice.downcase == "Delete Songs"
#       delete_song
#     elsif update_choice.downcase == "Play From Favourite List"
#       # To be worked on .
#     elsif update_choice.downcase == "Exit".downcase
#       puts "GOOD BYE!!"
#     end 
# end 

def delete 
  # Loop through user favsong, match songname with the one user wants to delete.
  # then delete it. 
  User.last.favsongs.select do |favsong|
      favsong.song.songname == 'South Side'
    end  
end 

def play_from_favourite_list(song)
    # What do you want to do?
    # Add songs.
    # Delete songs.
    # Play songs from favourite list. 
end 

def play_music(song)
  # Takes in user's choice of music to be played. 
  pastel = Pastel.new
  font = TTY::Font.new
  # To split songname and artist, then obtain the songname. 
  song_to_play = song.split(" by ").first 
  pid = fork{ exec 'afplay', "musics/#{song_to_play}.mp3"}
  # Display colored text while song is playing. 
  sleep(1)
  puts "Playing '#{song_to_play}' for you!!!".colorize(:yellow)
  sleep(2)  
  puts "\n"
  puts pastel.on_red(font.write("Enjoy"))
  sleep(2)
  puts pastel.on_yellow(font.write("Your "))
  sleep(2)
  puts pastel.on_cyan(font.write("Music "))
  sleep(2)
  puts pastel.on_magenta(font.write("      !!!        "))

  # Find duration of song, so we can pause terminal for that duration while song is playing:
  song_choice_instance = Song.all.find do |song|
                          song.songname == song_to_play
                        end
  # Get the duration attribute of the song and convert it to int.
  song_duration = song_choice_instance.duration.to_i
  sleep(song_duration)
end 
end 

# Saima updated these codes: 

# def delete_song
#   delete_prompt = TTY::Prompt.new
#   selected_song_idx = prompt.select('Select a song to delete. Scroll down to see the whole list!') do |song_list|
#     song_list.enum '.'
#     fav_songs_instances.each_with_index do |fav_song, i|
#       song_list.choice fav_song.song.songname, i
#     end
#   end
#   selected_id = fav_songs_instances[selected_song_idx].id
#   Favsong.delete(selected_id)
# end # end of delete method

def update_list
  # welcome_media
  add_delete_prompt = TTY::Prompt.new
  update_choice = add_delete_prompt.select('What do you want to do?', ['Add Songs', 'Delete Songs', 'Play Songs', 'Exit'])
  sleep(3)
  system 'clear'

  # welcome_media is the moodyTune animation.
  # welcome_media
  if update_choice.downcase == 'Add Songs'.downcase
    ask_mood_and_show_songs
    sleep(3)
    system 'clear'
    welcome_media
    print_fav_songs
    update_list
  elsif update_choice.downcase == 'Delete Songs'.downcase
    delete_song
    puts 'Your Song has been deleted successfully!!'
    sleep(3)
    system 'clear'
    welcome_media
    print_fav_songs
    update_list
    

  elsif update_choice.downcase == "exit".downcase
    puts "GOOD BYE!"
  end
end

def print_fav_songs
  puts 'Here are your favourite songs:'.colorize(:green)
  favourites = fav_songs_instances.each_with_index do |favsong, i|
    puts "#{i + 1}. #{favsong.song.songname.colorize(:red)} by #{favsong.song.artist} "
    sleep(0.2)
  end # loop ends
end
# end # end of moody class