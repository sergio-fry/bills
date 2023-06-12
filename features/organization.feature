Feature: Organizations

	Admin can create organization and invite users


	Background:
		Given logged in user


	Scenario: As registered user I can create new organization
		When visit "/"
		And click on "Organizations"
		And click on "New Organization"
		And fill in "Name" with "Team A"
		And click on "Create"

		Then visit "/"
		And click on "Organizations"
		Then see text "Team A"


	Scenario: As registered user I can't see organizations that
		I don't belong to

		Given organization "Team A"

		Then visit "/"
		And click on "Organizations"
		Then can't see text "Team A"
