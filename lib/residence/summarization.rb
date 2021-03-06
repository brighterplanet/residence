# sabshere 8/15/10 should this just be required in the emitter gem's lib/emitter.rb?
module BrighterPlanet
  module Residence
    module Summarization
      def self.included(base)
        base.summarize do |has|
          has.adjective lambda { |residence| "#{residence.rooms}-room" }, :if => :rooms
          has.identity [:residence_class, :name], :if => :residence_class
          has.identity
          has.modifier lambda { |residence| "in #{residence.zip_code.description_with_state_name}"}, :if => :zip_code
          has.modifier lambda { |residence| "with #{residence.residents} residents"}, :if => :residents
          has.verb :occupy
        end
      end
    end
  end
end
