Template.signup.events

	'submit form': (e, t) ->
		e.preventDefault()
		$form = ($ t.find '#payment-form')
		$form.find('button').prop('disabled', true);
		Stripe.card.createToken $form, (status, response) ->
			console.log status, response
			unless response.error
				opt =
					username: ($ t.find '.data-user-username').val()
					email: ($ t.find '.data-user-email').val()
					password: ($ t.find '.data-user-password').val()
				Accounts.createUser opt, (err) ->
					unless err
						Router.go 'home'
