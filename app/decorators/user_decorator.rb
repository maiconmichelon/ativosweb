class UserDecorator < Draper::Decorator
  delegate_all

  def companies
    companies = Company.where(owner: user)

    CompanyUser.where(user: user).each do |company_user|
      companies << company_user.company unless companies.include? company_user.company
    end

    companies
  end

  def pending_requests
    Request.where(approval_responsible: user, status: 0)
  end

end
