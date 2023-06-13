@wip
Feature: Expencies

	Org owner can track expencies


	Background:
		Given logged in user
		And create organization "Team A"
		And track income "100"

	Scenario: I can track incomes
		When track expense "50" with comment "ball"
		Then organization balance is "50"

		When tack expense "60" with comment "60"
		Then organization balance is "-10"
