@Users = Meteor.users

Users.helpers

	displayName: -> @profile?.firstName + ' ' + @profile?.lastName

	bidAbbr: -> (@bid).abbr(2)

	activitiesAbbr: -> (@stats?.activities).abbr(2)

	followingsAbbr: -> (@stats?.followings).abbr(2)

	followersAbbr: -> (@stats?.followers).abbr(2)

	createdAtFromNow: -> moment(@createdAt).fromNow()

Users.before.insert (userId, user) ->
	unless user.createdAt
		_.extend user,
			createdAt: new Date()

Users.before.insert (userId, user) ->
	if user.username is 'crapthings'
		_.extend user,
			bid: _.random 1000000, 10000000

Users.after.insert ->

	System.update { init: true },
		$inc:
			'stats.members': 1

if Meteor.isServer

	Meteor.publish '', ->
		Users.find {},
			fields:
				services: false
