module InformationController
  extend ActiveSupport::Concern

  included do
    before_action :set_power_unit

    private
      def power_unit
        @power_unit ||= PowerUnit.find(params[:power_unit_id])
        @power_unit
      end

      def set_power_unit
        power_unit
      end
  end
end
