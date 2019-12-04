## Process
## Steps 
1. Welcome Message
2. Ask User Name
3. User Inputs their username
4. Greet user with name!
5. Ask if the user want to see their favorite song
6. Give Option YES or No
7. If Yes AND list exist Display the favorite list
   - prompt message "What would you like to do? 
   - "1. ADD SONGS 2. DELETE SONGS" 3.Play from list 4. Exit! 
        - 3. plays a random song from user's favourtie list.
   - delete song from the list
   - add song (ask for mood , pick songs and add to fav list)
   - and ask if they want to play the song from the list
8. if no fav list - find new song by mood (mood method)
9. If no ask their mood and prompt them to pick songs
10.  pick songs
11. play songs (if possible)
12. ask if they want to save the songs
13. if yes add to fav list method and (exit)
14. if no , ask if they want more music
    (if yes prompt them with mood method / if no EXIT! )
### Setup
1. Create Gemfile + run `bundle`
2. Create migrations: run `rake db:create_migration` and add the syntax you need (e.g. NAME=create_users)
3. Migrate: run `rake db: migrate`
* **REMEMBER** never ever ever change anything in schema.
4. Go to .bin/run.rb and change the name of the app on line 3
5. Go to ./app/models and change the names of the files (e.g. User.rb <- singular) and the class names inside
6. Set up associations in classes (belongs_to / has_many / has_many through:)
7. Create seed data + run `rake db: seed`
* remember: seeding does not give you any output so no news on your console == good news
8. Check if you've seeded correctly: run `rake c` and check what's the last instance of any of your class 
9. Go to ./app/yourAppName.rb and change that file's name and whatever is inside (the class name should correspond to what you wrote in .bin/run.rb on line 3)

### Coding
1. Create a dummy version of your logic -> hardcode it and don't yet make your code save anything to the database, just make sure that the logic works
2. Test often by running the file or by binding.pry
3. What I fould useful is drowing out every step I want to guide users through before coding - my whiteboard looked like this:
![](Sunday.jpg)
4. Then I coded the dummy version (without saving to the database, just to see if all "if"s are working and all that jazz)
5. Then I added the database manipulations.
6. Then I beautified the code and the app to make it visually pleasing

## APIs

- [Dad Jokes API Docs](https://icanhazdadjoke.com/api)
- [Sample API Request](https://icanhazdadjoke.com/api#fetch-a-random-dad-joke)

- **[More APIs]**(https://rapidapi.com/collection/cool-apis)
- [And even more APIs](https://medium.com/@vicbergquist/18-fun-apis-for-your-next-project-8008841c7be9)

## Fun Gems For Your Projects
- `faker` - randomly generated seed data fun
- `colorize` - colored text output in your terminal
- `lolcat` - enabling rainbow text coloring
- `rest-client` - make HTTP requests and get data from APIs
- `tty-prompt` - nice interface for prompting for user input
- `formatador` - styling output information into a neat table
- `artii` - creating text banners

## Tutorials
- [Using TTY Prompt by Brandon James](https://medium.com/@brandonj2858/benefits-of-using-tty-prompt-for-my-first-project-e5cfbc598a62)
- [Adding animations to your CLI by Sylwia Vargas](https://medium.com/better-programming/add-an-animation-or-a-giph-to-your-ruby-cli-29952e8c46ea)
- [Adding ASCII Art to your CLI by Sylwia Vargas](https://medium.com/@sylwiavargas/adding-pictures-to-your-ruby-cli-4252b89823a)
- [Using Time/Date in your CLI by Joel Mendoza](https://medium.com/@joelmendza173/ruby-date-time-for-dummies-9f45518bab64)
- [Resetting your database indexes by Sylwia Vargas]()
