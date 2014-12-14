Feature: Seed Once
  Scenario: Seed a record once
    Given I have already seeded a record
    When I seed the record using seed_once
    Then I should not seed the record again
