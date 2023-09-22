class UserDecorator < BaseDecorator
  def name_with_role
		"#{name} #{role}"
	end
end