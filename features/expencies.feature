@wip
Feature: Expencies

	Org owner can track expencies


	Background:
		Given organization "Team A"
		And organization got income with amount "100"
		And logged in as owner of organization


	Scenario: I can track incomes
		When expense "ball" with amount "50" is tracked
		Then organization balance is "50"

		When expense "water" with amount "60" is tracked
		Then organization balance is "-10"
