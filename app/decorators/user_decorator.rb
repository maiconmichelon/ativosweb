class UserDecorator < Draper::Decorator
  delegate_all

  def companies
    companies = []

    Company.where(owner: user).each do |company|
      companies << company
    end

    CompanyUser.where(user: user).each do |company_user|
      companies << company_user.company unless companies.include? company_user.company
    end

    companies
  end

  def company_by_id(id) 
    id = id.to_i
    self.companies.each do |company|
      return company if company.id.eql? id
    end
  end

  def pending_requests
    Request.where(approval_responsible: user, status: 0)
  end

end
