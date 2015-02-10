class Team < ActiveRecord::Base
    
    has_and_belongs_to_many :questions
    has_many :team_members
    
    validates :name, presence: true, length: { maximum: 50 },
                    uniqueness: { case_sensitive: false }
                    
    validates :school, length: { maximum: 60 }
    has_secure_password
    validates :password, length: { minimum: 3 }
    
    
    def Team.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
end
