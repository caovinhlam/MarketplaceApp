# frozen_string_literal: true

class SessionPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    return @user
  end

  def new?
    create?
  end

  def update?
    return @user && @record.user_id == @user.id
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  def my_session?
    create?
  end

  def edit_and_destroy?
    return @user && (edit? && destroy?)
  end
  
  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
