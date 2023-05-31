Feature: Organizations

	Admin can create organization and invite users


	Background:
		Given Logged in user


	Scenario: As registered user I can create new organization
		When Visit "/"
		And Click on "Organizations"
		And Click on "New Organization"
		And Fill in "Name" with "Team A"
		And Click on "Create"

		Then Visit "/"
		And Click on "Organizations"
		Then See text "Team A"


	Scenario: As registered user I can't see organizations that
		I don't belong to

		Given Oraganization "Team A"

		Then Visit "/"
		And Click on "Organizations"
		Then Can't see text "Team A"
