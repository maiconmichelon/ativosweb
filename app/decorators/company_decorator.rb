class CompanyDecorator < Draper::Decorator
  delegate_all

  def all_with_permission
    admins + not_admin_users
  end

  def users(context)
    return admins if context == :admin
    return not_admin_users if context == :not_admin
    without_permission_users
  end

  def not_admin_users
    cusers = company_users.select {|company_user| !company_user.admin? }
    cusers.map { |company_user| company_user.user }
  end

  def without_permission_users
    users = User.all
    users.select { |user| company_user_by_user(user).nil? && !user.eql?(owner) }
  end

  def owner?(user)
    owner.eql? user
  end

  def admin?(user)
    admins.include?(user)
  end

  def admins
    admins = company_users.select {|company_user| company_user.admin? }
    admins.map! { |company_user| company_user.user }
    admins << owner
    admins
  end

  def company_user_by_user(user)
    company_user = nil

    company_users.each do |c|
      if c.user.eql? user
        company_user = c
      end
    end

    return company_user
  end

end
