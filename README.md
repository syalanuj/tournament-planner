# **Tournament-Planner**

##**Background**
Tournament Planner correspond to the second project within the Udacity FullStack Developer Nanodegree  to keep track of players and matches in a game tournament.
Usese python tournament.py and PostgreSQL database (initialize script tournament.sql)


##**Description**
Tournament Planner keep track of players and matches in a game tournament.
The game tournament uses the Swiss system (http://en.wikipedia.org/wiki/Swiss-system_tournament) for pairing up players in each round where players are not eliminated, and each player should is paired with another player with the same number of wins, or as close as possible. You start by registering an even number of players and you pair them up and record the match results. You keep doing this as many times as needed till you get a champion.

###**Modules**
1. tournament.sql :  This is the script that contains the database schema and once ran it creates all the tables and views need.
2. tournament.py : This is the python module that contains the implementation of the functionality.

3. tournament_test.py :  test file which is already covers most test cases by udacity.

##Documentation
The following is just a brief description of each method within the tournament.py  module:

1. registerPlayer(name) : Adds a player to the tournament by putting an entry in the database.
2. countPlayers() : Returns the number of currently registered players.
3. deletePlayers() : Clear out all the player records from the database.
4. reportMatch(winner, loser) : Stores the outcome of a single match between two players in the database.
5. deleteMatches() : Clear out all the match records from the database.
6. playerStandings() : Returns a list of id, name, wins, matches for each player, sorted by the number of wins each player has.
7. swissPairings() : Given the existing set of registered players and the matches they have played, generates and returns a list of pairings according to the Swiss system.

##Installation
If you would like to run this project using the Udacity VM you will need to do the following: 

1. Install Git from http://git-scm.com/
2. Install VirtualBox. VirtualBox is the software that actually runs the VM. 
3. Install Vagrant from https://www.vagrantup.com/
4. Use Git to fetch the VM configuration: ``` git clone http://github.com/udacity/fullstack-nanodegree-vm fullstack ```
5. Using the terminal, change directory to fullstack/vagrant (cd fullstack/vagrant), then type vagrant up to launch your virtual machine. 
6. type vagrant ssh to log into it. 
7. type ```cd /vagrant/tournament```.Check everything is in place by typing ``` ls ``` and you should see the three files; tournament.sql, tournament_test.py and tournament.py
8. type ``` psql ```
9. run ``` \i tournament.sql ```. This should install the database
10. exit the psql by typing ``` \q ``` 
11. run ``` python tournament_test.py ```
12. if everything went ok, then you should see a final messege saying All the test were passed!


##Author
Anuj Syal
