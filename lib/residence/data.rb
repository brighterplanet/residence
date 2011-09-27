# sabshere 8/15/10 should this just be required in the emitter gem's lib/emitter.rb?
# (i can see why not... you might not always want data_miner)
module BrighterPlanet
  module Residence
    module Data
      def self.included(base)
        base.col :residence_class_id
        base.col :urbanity_id
        base.col :zip_code_id
        base.col :construction_year, :type => :date
        base.col :ownership, :type => :boolean
        base.col :occupation, :type => :float
        base.col :residents, :type => :integer
        base.col :floors, :type => :integer
        base.col :floorspace_estimate, :type => :float
        base.col :air_conditioner_use_id
        base.col :dishwasher_use_id
        base.col :clothes_machine_use_id
        base.col :refrigerator_count, :type => :integer
        base.col :freezer_count, :type => :integer
        base.col :lighting_efficiency, :type => :float
        base.col :bedrooms, :type => :integer
        base.col :dining_rooms, :type => :integer
        base.col :living_rooms, :type => :integer
        base.col :kitchens, :type => :integer
        base.col :full_bathrooms, :type => :integer
        base.col :half_bathrooms, :type => :integer
        base.col :bathrooms, :type => :float
        base.col :other_rooms, :type => :integer
        base.col :heated_garage_berths, :type => :integer
        base.col :annual_fuel_oil_volume_estimate, :type => :float
        base.col :annual_fuel_oil_cost, :type => :float
        base.col :monthly_natural_gas_volume_estimate, :type => :float
        base.col :monthly_natural_gas_cost, :type => :float
        base.col :monthly_electricity_use_estimate, :type => :float
        base.col :monthly_electricity_cost, :type => :float
        base.col :green_electricity, :type => :float
        base.col :annual_propane_volume_estimate, :type => :float
        base.col :annual_propane_cost, :type => :float
        base.col :annual_wood_volume_estimate, :type => :float
        base.col :annual_kerosene_volume_estimate, :type => :float
        base.col :annual_coal_volume_estimate, :type => :float
        base.col :annual_coal_cost, :type => :float
        base.col :acquisition, :type => :date
        base.col :retirement, :type => :date

        base.data_miner do
          process "pull orphans" do
            ResidenceFuelType.run_data_miner!
            ResidenceFuelPrice.run_data_miner!
            ResidentialEnergyConsumptionSurveyResponse.run_data_miner!
          end
        end
      end
    end
  end
end