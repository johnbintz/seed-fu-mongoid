Feature: Seed From Block
  Scenario: Seed new records from block
    When I seed records from a block
    Then I should have the new records
