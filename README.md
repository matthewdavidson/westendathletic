# West End Athletic

Amateur football team website.

## TODO

1. Finish off admin sections:
	- The ability to add matches and results
	- The ability to add player stats
	- The ability to add generic news items
2. Add public facing pages
	- League table
	- Fixtures
	- Statistics and player profiles
	- News feed comprised of
		- Generic news items
		- Results, upcoming matches etc
3. Facebook integration
	- Basic like functionality
	- Comments for results, player profiles and news items
	- Facebook open graph events for results and goals etc

## Notes

1. I am still undecided as of how to specify a certain team as the home team.
	 I could add a column to the teams table to indicate whether a team is the 
	 home team or not. But this would result in a lot of unecessary validation 
	 to make sure there was only one home team not to mention bad erm design.
	 I am going to look into setting the home team in a configuration file. This
	 home team can be loaded into the db as seed data. I can then extend the Team
	 model with a helper method such as .home_team? to determine home team logic.
2. The user management is a little off just now. I can either have two types of
	 admin user, one as the super admin and one that is unable to acces user 
	 management. Currently each user has CRUD access to all users.
3. I realise there is a distinct lack of tests surrounding the current functionality.
	 Keeping in mind [a certain example](http://37signals.com/svn/posts/3159-testing-like-the-tsa)
	 I do intend to add some tests around the user admin login and keep on top of
	 things when I encounter some more complicated functionality.