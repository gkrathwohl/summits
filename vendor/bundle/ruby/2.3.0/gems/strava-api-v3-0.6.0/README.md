# strava-api-v3

[![Build Status](https://secure.travis-ci.org/jaredholdcroft/strava-api-v3.png)](http://travis-ci.org/jaredholdcroft/strava-api-v3) [![Code Climate](https://codeclimate.com/github/jaredholdcroft/strava-api-v3.png)](https://codeclimate.com/github/jaredholdcroft/strava-api-v3)

This gem provides a wrapper around the Strava API V3 - [http://strava.github.io/api/](http://strava.github.io/api/)

## Install

gem install 'strava-api-v3'

## Create a client

At this point you will need to have the user authorise your application using OAuth2.

```ruby

@client = Strava::Api::V3::Client.new(:access_token => "MY_ACCESS_TOKEN")
```

## Call API methods

### Activity

Each method returns a JSON object - see [http://strava.github.io/api/v3/activities/](http://strava.github.io/api/v3/activities/) for more info

```ruby

@client.retrieve_an_activity(:some_id)

@client.list_athlete_activities

@client.list_friends_activities

@client.list_activity_zones(:some_id)

@client.list_activity_laps(:some_id)

```

### Athlete

Each method returns a JSON object - see [http://strava.github.io/api/v3/athlete/](http://strava.github.io/api/v3/athlete/) for more info

```ruby

@client.retrieve_current_athlete # fetch the authenticated athlete

@client.retrieve_another_athlete(:some_id) # fetch another athlete by id

@client.list_athlete_segment_efforts(:some_id) # fetch K/QOMs/CRs for another athlete by id

@client.list_athlete_friends # fetch friends list

@client.list_specific_athlete_friends(:some_id) # fetch friends list another athlete by id

@client.totals_and_stats(:some_id) # fetch athlete totals and stats

```

### Club

Each method returns a JSON object - see [http://strava.github.io/api/v3/clubs/](http://strava.github.io/api/v3/clubs/) for more info

```ruby

@client.retrieve_a_club(:some_id)

@client.list_athlete_clubs

@client.list_club_members(:some_id)

@client.list_club_activities(:some_id)

```

### Gear

Each method returns a JSON object - see [http://strava.github.io/api/v3/gear/](http://strava.github.io/api/v3/gear/) for more info

```ruby

@client.retrieve_gear(:some_id)

```

### Route

Each method returns a JSON object - see [http://strava.github.io/api/v3/routes/](http://strava.github.io/api/v3/routes/) for more info

```ruby

@client.retrieve_a_route(:some_id)

@client.list_athlete_route

```

### Segment

Each method returns a JSON object - see [http://strava.github.io/api/v3/segments/](http://strava.github.io/api/v3/segments/) for more info

```ruby

@client.retrieve_a_segment(:some_id)

@client.list_starred_segment

@client.segment_leaderboards(:some_id)

@client.segment_explorer

```

### Segment Effort

Each method returns a JSON object - see [http://strava.github.io/api/v3/efforts/](http://strava.github.io/api/v3/efforts/) for more info

```ruby

@client.retrieve_a_segment_effort(:some_id)

```

### Stream

Each method returns a JSON object - see [http://strava.github.io/api/v3/streams/](http://strava.github.io/api/v3/streams/) for more info

```ruby

@client.retrieve_activity_streams(:some_id)

@client.retrieve_effort_streams(:some_id)

@client.retrieve_route_streams(:some_id)

@client.retrieve_segment_streams(:some_id)


```

### Upload

Support for uploading activity files (FIT, TCX and GPX file types are supported by Strava. See [https://strava.github.io/api/v3/uploads/](https://strava.github.io/api/v3/uploads/) for more info

```ruby

# Prepare options for upload
options = {}
options[:activity_type] = 'ride'
options[:data_type] = 'tcx'

# Open the file from the file systems
options[:file] = File.new('myfile.tcx')

# Submit upload and get upload ID
status = @client.upload_an_activity(options)
upload_id = status['id']

# Re-poll for status
status = @client.retrieve_upload_status(upload_id)

```


## Contributors

* Jared Holdcroft
* James Chevalier
