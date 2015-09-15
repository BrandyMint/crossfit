class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless Phoner::Phone.valid? value
      record.errors.add attribute, I18n.t('activerecord.errors.models.user.attributes.phone')
    end
  end
end
