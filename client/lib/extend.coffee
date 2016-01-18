_.extend Meteor,

	signout: (path) ->
		Meteor.logout (err) ->
			unless err
				if path
					Router.go path
				else
					Router.go 'home'
