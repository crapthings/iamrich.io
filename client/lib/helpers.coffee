helper = Template.registerHelper

helper 'system', ->
	System.findOne { init: true }

# users helper

helper 'mostFamousUsers', (limit) ->
	Users.find {},
		sort:
			'stats.followers': -1
		limit: limit

helper 'mostFollowersUsers', (limit) ->
	Users.find {},
		sort:
			'stats.followers': -1
		limit: limit

helper 'mostFollowingsUsers', (limit) ->
	Users.find {},
		sort:
			'stats.followings': -1
		limit: limit

helper 'mostActivitiesUsers', (limit) ->
	Users.find {},
		sort:
			'stats.activities': -1
		limit: limit

helper 'latestUsers', (limit) ->
	Users.find {},
		sort:
			createdAt: -1
		limit: limit

helper 'topOneUser', ->
	Users.findOne {},
		sort:
			bid: -1
		limit: 1

helper 'topTwoUsers', ->
	Users.find {},
		sort:
			bid: -1
		limit: 2
		skip: 1

helper 'topThreeUsers', ->
	Users.find {},
		sort:
			bid: -1
		limit: 3
		skip: 3

helper 'users', ->
	Users.find {}

helper 'activities', ->
	Activities.find {},
		sort:
			createdAt: -1

helper 'getActivitiesByUsername', (username) ->
	Activities.find { 'user.username': username },
		sort:
			createdAt: -1

helper 'sugarAbbr', (number) -> (number)?.abbr(2)
