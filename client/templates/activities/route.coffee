Router.route '/activities'

Router.route '/$/:username', ->
	@render '$username',
		data: ->
			console.log @params.username
			user: Users.findOne @params.username
			activities: Activities.find { 'user.username': @params.username },
				sort:
					createdAt: -1
,
	name: '$username'
