Feature: Seed From Hash
  Scenario: Seed new records from hash
    When I seed records from a hash
    Then I should have the new records

  Scenario: Update existing records from a hash
    Given I have an existing record
    When I seed records from a hash
    Then I should have the new records
