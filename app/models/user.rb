class User < ActiveRecord::Base
    validates :username, uniqueness: true #para que no haya usuarios repetidos
    has_many :favorites
    before_save  :encrypt_password



    def self.authenticate(email, password)
		user = User.find_by email: email

		return unless user # false si no esta instanciado user
		return user if user.password == User.encrypt(password, user.salt)
	end

	def self.encrypt(password, salt)
		Digest::SHA2.hexdigest "#{password}>>#{salt}<<G>>"
	end

	def update_password(password)
		self.salt = generate_salt
		self.password = User.encrypt password, self.salt
	end

	def update_career(career)
		User.career = career
	end

	private
		def encrypt_password
			if self.new_record?
				self.salt = generate_salt
				self.password = User.encrypt self.password, self.salt
			end
		end

		def encrypt_confirm_password
			if self.new_record?
				self.confirm_password = User.encrypt self.confirm_password, self.salt
			end
		end

		def generate_salt
			Digest::SHA2.hexdigest "#{SecureRandom.hex 8} #{Time.now.utc}"
		end

end
