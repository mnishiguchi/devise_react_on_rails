# class IdentityPolicy
#   attr_reader :current_identity, :record
#
#   def initialize(current_identity, record)
#     @current_identity = current_identity
#     @record = record
#   end
#
#   def index?
#     true
#   end
#
#   def show?
#     @current_identity.admin?
#   end
#
#   def create?
#     false
#   end
#
#   def new?
#     false
#   end
#
#   def update?
#     false
#   end
#
#   def edit?
#     false
#   end
#
#   def destroy?
#     false
#   end
# end
