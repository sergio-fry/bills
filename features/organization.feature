Feature: Organizations

	Admin can create organization and invite users


	Background:
		Given logged in user


	Scenario: As registered user I can create new organization
		When visit "/"
		And click on "Organizations"
		And click on "new organization"
		And fill in "Name" with "Team A"
		And click on "create"

		Then visit "/"
		And click on "Organizations"
		Then see text "Team A"


	Scenario: As registered user I can't see organizations that
		I don't belong to

		Given organization "Team B" owned by another user 

		Then visit "/"
		And click on "Organizations"
		Then can't see text "Team B"
