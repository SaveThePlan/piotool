# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.wrappers :custom, tag: 'div', class: 'field', error_class: 'error' do |div_field|
    div_field.use :html5
    div_field.use :placeholder
    div_field.use :label
    div_field.use :input, class: 'form-control'
    div_field.use :error      , wrap_with: { tag: 'p', class: 'field_error' }
    div_field.use :hint       , wrap_with: { tag: 'p', class: 'field_hint'  }
  end

  # Fix for simple_form display
  inputs = %w[
    CollectionSelectInput
    DateTimeInput
    FileInput
    GroupedCollectionSelectInput
    NumericInput
    PasswordInput
    RangeInput
    StringInput
    TextInput
  ]

  inputs.each do |input_type|
    superclass = "SimpleForm::Inputs::#{input_type}".constantize

    new_class = Class.new(superclass) do
      def input_html_classes
        super.push('form-control')
      end
    end

    Object.const_set(input_type, new_class)
  end


  config.default_wrapper = :custom
  config.boolean_style = :inline
end
