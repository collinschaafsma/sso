class Identity
  include Mongoid::Document

  field :name, :type => String
  field :email, :type => String
  field :password_digest, :type => String

end
