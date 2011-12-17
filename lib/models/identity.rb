class Identity

  include Mongoid::Document
  include OmniAuth::SimpleIdentity::Models::Mongoid

  field :email, type: String
  field :name, type: String
  field :password_digest, type: String

end
