Feature: Member Management

	Org owner can add, remove, invite, deactivate users


	Background:
		Given logged in user
		And create organization "Team A"


	Scenario: I can add a member
		When visit organization page
		And click on "add member"
		And fill in "Name" with "Ivan"
		And fill in "Phone" with "+123456789"
		And click on "save"

		Then visit organization page
		And see text "Ivan"
