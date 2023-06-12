Feature: Member Management

	Org owner can add, remove, invite, deactivate users


	Background:
		Given organization "Team A"
		And logged in as owner of Organization "Team A"


	Scenario: I can add a member
		When visit "Team A" organization page
		And click on "add member"
		And fill in "Name" with "Ivan"
		And fill in "Phone" with "+123456789"
		And click on "save"

		Then visit "Team A" organization page
		And see text "Ivan"
