module PermitsAttributes
  extend ActiveSupport::Concern

  module ClassMethods
    def attributes_list
      self.attribute_names.map { |string_name| string_name.to_sym }
    end

    def permits_params(params)
      if params.is_a?(ActionController::Parameters)
        params.permit(attributes_list)
      else
        params.select { |key, value| attributes_list.include? key.to_sym }
      end
    end
  end

end
