Feature: Member Management

	Org owner can add, remove, invite, deactivate users


	Background:
		Given Organization "Team A"
		And Logged in as owner of Organization "Team A"


	Scenario: I can add a member
		When Visit "Team A" organization page
		And Click on "Add Member"
		And Fill in "Name" with "Ivan"
		And Fill in "Phone" with "+123456789"
		And Click on "Save"

		Then Visit "Team A" organization page
		And See text "Ivan"
