class Company < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'

  validates_presence_of :name

  has_many :fixtures
  has_many :groups
  has_many :components
  has_many :providers
  has_many :types
  has_many :budgets

  has_many :maintenances, through: :fixtures
  has_many :people, through: :groups

  has_many :company_users

  def owners
    owners = company_users.select {|company_user| company_user.admin? }
    owners << owner
  end

  def not_admin_users
    owners = company_users.select {|company_user| !company_user.admin? }
  end

  def without_permission_users
    own = owners
    User.all.select {|user| !own.include?(user)}
  end

  def admin?(user)
    owners.include?(user)
  end

end
