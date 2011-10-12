Feature: Residence Emissions Calculations
  The residence model should generate correct emission calculations

  Scenario Outline: Standard Calculations for residence
    Given it has "zip_code.name" of "<zip_code>"
    And it has "floorspace_estimate" of "<floorspace>"
    And it has "residence_class.name" of "<residence_class>"
    And it has "urbanity.name" of "<urbanity>"
    And it has "dishwasher_use.name" of "<dishwasher_use>"
    When impacts are calculated
    Then the amount of "carbon" should be within "0.1" kgs of "<emission>"
    Examples:
      | zip_code | floorspace | residence_class                                                                 | urbanity | dishwasher_use      | emission  |
      |    48915 |       1400 | Single-family detached house (a one-family house detached from any other house) |     City | 4 to 6 times a week | 6091.88178 |
