@Activities = new Mongo.Collection 'activities'

Activities.helpers

	user: -> Users.findOne @userId

Activities.before.insert (userId, activity) ->
	_.extend activity,
		createdAt: new Date()

Activities.after.insert (userId, user) ->
	Users.update user.userId,
		$inc:
			'stats.activities': 1
