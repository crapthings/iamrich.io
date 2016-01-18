faker = Meteor.npmRequire 'faker'

Meteor.startup ->

	Users.remove {}
	Activities.remove {}

	unless Users.findOne()

		_(50).times (n) ->

			number = _.random 10, 30

			userId = Users.insert
				createdAt: faker.date.past()
				username: faker.internet.userName()
				profile:
					firstName: faker.name.firstName()
					lastName: faker.name.lastName()
					avatarUrl: faker.internet.avatar()
					quote: faker.lorem.sentences()
				bid: _.random 10000, 1000000
				stats:
					followings: _.random 500, 5000
					followers: _.random 500, 5000
					pv: _.random 2000, 20000
				, ->
					_(number).times ->
						Meteor.defer ->
							Activities.insert
								userId: userId
								content: faker.lorem.sentences()

		Accounts.createUser
			username: 'crapthings'
			password: 'adminqqc'
			profile:
				firstName: 'Zhang'
				lastName: 'Hong'
				avatarUrl: 'https://avatars2.githubusercontent.com/u/1147704?v=3&s=460'
				quote: faker.lorem.sentences()
