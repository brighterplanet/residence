Feature: Residence Committee Calculations
  The residence model should generate correct committee calculations

  Scenario Outline: Bathrooms committee
    Given a residence has "full_bathrooms" of "<full_baths>"
    And it has "half_bathrooms" of "<half_baths>"
    When emissions are calculated
    Then the bathrooms committee should be exactly "<bathrooms>"
    Examples:
      | full_baths | half_baths | bathrooms |
      |          2 |        0.5 |       2.5 |

  Scenario Outline: Predicted annual electricity use committee
    Given a residence has "lighting_efficiency" of "<lighting_efficiency>"
    When emissions are calculated
    Then the predicted_annual_electricity_use committee should be exactly "<predicted_annual_electricity_use>"
    Examples:
      | lighting_efficiency | predicted_annual_electricity_use |
      | 0.5                 |                 14409.3456880943 |
