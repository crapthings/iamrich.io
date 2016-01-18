Template.signin.events

	'submit form': (e, t) ->
		e.preventDefault()
		$email = ($ t.find '.data-user-email').val()
		$password = ($ t.find '.data-user-password').val()
		Meteor.loginWithPassword $email, $password, (err) ->
			unless err
				Router.go 'home'
