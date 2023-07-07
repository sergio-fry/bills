Feature: Expencies

	Org owner can track expencies


	Background:
		Given logged in user
		And create organization "Team A"
		And track income "100"

	Scenario: I can track incomes
		When track expense "50" with comment "ball"
		Then organization balance is "50"

		When track expense "40" with comment "pens"
		Then organization balance is "10"
