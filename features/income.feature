@wip
Feature: Income

	Org owner can track incomes


	Background:
		Given Organization "Team A"
		And Logged in as owner of Organization "Team A"


	Scenario: I can track incomes
		When Visit "Team A" organization page
		And Click on "Track Income"
		And Fill in "Amount" with "100"
		And Fill in "Member" with "Ivan"
		And Click on "Track"

		Then Visit "Team A" organization page
		And See text "Balance: 100"
