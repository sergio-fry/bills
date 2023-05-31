Feature: Organizations

	Admin can create organization and invite users


	Scenario: As registered user I can create new organization
		Given Logged in user

		When Visit "/"
		And Click on "Organizations"
		And Click on "New Organization"
		And Fill in "Name" with "Team A"
		And Click on "Create"

		Then Visit "/"
		And Click on "Organizations"
		Then See text "Team A"
