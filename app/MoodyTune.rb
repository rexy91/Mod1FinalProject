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
      sleep(0.5)
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
  pastel = Pastel.new
  font = TTY::Font.new
  # We initiazlied prompt, only need to do it once? 
  # prompt_save = TTY::Prompt.new
  # new_prompt = TTY::Prompt.new
  sleep(1)
  song_choice = prompt.multi_select("Here are the songs matching your mood, please choose:",songs)
  
  choice = prompt.select("Which one do you want to listen to? ", song_choice)
  system "clear"

  song_to_play = choice.split(" by ").first 
  
  pid = fork{ exec 'afplay', "#{song_to_play}.mp3" }
 
  puts "Playing '#{song_to_play}' for you!!!".colorize(:yellow)
  
  puts pastel.red(font.write("Enjoy!!"))

  # ** Insert pic/animation while song is being played 

  # Need to sleep for the song's duration.
  # Play for 30 secs then mute the song. 

  # Find duration of song:
  song_duration =  Song.all.find do |song|
          song.songname == song_to_play
      end
  sleep(0)

  system "clear "
  
  prompt_yes_no = prompt.select("Do you want to add the songs to favourite list?", ["Yes", "No"])
  add_to_fav_list(song_choice)
  #** Try to play the song_choice music.
end # End of method

def add_to_fav_list(song_choice)
    song_choice.each do |song|
        song_id = Song.find_by(songname: song.split(' by ').first).id
           Favsong.create(user_id: @user.id, song_id: song_id)
        # binding.pry
    end
    puts "You have added your songs successfully!".colorize(:green)
end # End of method


def show_favrouite_songs
      fav_songs = fav_songs_instances
      puts 'Would you like to see your favourite songs?'.colorize(:green)
      input = gets.chomp

      if input.downcase == 'yes' # and fav_songs is empty, puts 'no fav songs.'
        sleep(1)
        puts "\n"
        # If favrouite is empty , puts sorry message.
         if fav_songs.empty?
            puts "Sorry, your favourite list is empty. \n Lets add songs to the list.".colorize(:green)
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

  def update_list
    add_delete_prompt = TTY::Prompt.new
    update_choice = add_delete_prompt.select("Would you like tp update your playlist?",["Add Songs", "Delete Songs", "Exit"])

    if update_choice.downcase == "Add Songs".downcase
      ask_mood_and_show_songs
    elsif update_choice.downcase == "Delete Songs"
      delete_song
    end

  end


end # end of moody class