@System = new Mongo.Collection 'system'

if Meteor.isServer

	faker = Meteor.npmRequire 'faker'

	Meteor.publish '', ->
		System.find { init: true }

	System.remove {}

	unless System.findOne { init: true }

		System.insert
			about: faker.lorem.sentences()
			membership: faker.lorem.sentences()
			init: true
			stats:
				members: _.random 1000000, 5000000
				activities: _.random 50000000, 100000000
				groups: _.random 1000000, 5000000
				photos: _.random 50000000, 100000000
				pv: _.random 100000000, 999999999
