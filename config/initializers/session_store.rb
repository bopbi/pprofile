# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pprofile_session',
  :secret      => '6198a501d38cffda1d4ecef8a6f34db8253adf5f5d50de159a8e5c7745e58c337274ca81b663554c1fcd82b96aed37de508b9697bbd1df2c02ff45fcd5984d4e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
