class Company
  include Mongoid::Document
  field :ticker, type: String
  field :name, type: String
  field :industry, type: String
  field :active, type: Mongoid::Boolean
  field :ignore, type: Mongoid::Boolean, default: false
  field :roar, type: Float
  field :_id, type: String, default: -> {ticker}

  index({ticker: 1, suffix: 1},
  { unique: true })

  default_scope -> {where(ignore: false)}

  has_many :prices
  belongs_to :exchange
end
