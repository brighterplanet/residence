Feature: Residence Committee Calculations
  The residence model should generate correct committee calculations

  Scenario Outline: Bathrooms committee
    Given a residence emitter
    And a characteristic "full_bathrooms" of "<full_baths>"
    And a characteristic "half_bathrooms" of "<half_baths>"
    When the "bathrooms" committee is calculated
    Then the bathrooms committee should be exactly "<total>"
    Examples:
      | full_baths | half_baths | total |
      |          1 |          0 |   1.0 |
      |          2 |          1 |   2.5 |
      |          3 |          2 |   4.0 |

  Scenario Outline: Predicted annual electricity use committee from cohort
    Given a residence emitter
    And a characteristic "bedrooms" of "<bedrooms>"
    And a characteristic "lighting_efficiency" of "<lighting_efficiency>"
    When the "cohort" committee is calculated
    And the "predicted_annual_electricity_use" committee is calculated
    Then the conclusion of the committee should be "<prediction>"
    Examples:
      | bedrooms | lighting_efficiency | prediction  |
      | 3        | 0.5                 | 12393.36822 |

  Scenario: Predicted annual electricity use committee from default
    Given a residence emitter
    And a characteristic "lighting_efficiency" of "0.5"
    When the "predicted_annual_electricity_use" committee is calculated
    Then the conclusion of the committee should be "10752.83"
