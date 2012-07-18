# Seed the database with a default admin user.
# This user will allow acces to the admin area on 
# a clean install.
#
# For security, the credentials for this user must 
# be changed immediately after deployment to any 
# production environments

User.create(
	username: 'admin', 
	email: 'admin@emailaddress.com',
	password: 'password',
	password_confirmation: 'password'
)