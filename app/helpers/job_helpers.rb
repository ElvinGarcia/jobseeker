class Job_helpers

    def self.current_user(session)
        @user = Job.find(session[:job_id])
        @user
    end

    def self.logged_in?(session)
      !!session[:job_id]
    end

    def self.find_and_auth(params)
        @user = Job.find_by(username: params[:username]).try(:authenticate, params[:password])
       @user
     end

    def self.empty?(params)
      params.values.collect{|values| values.strip}.include?("")
    end


end
