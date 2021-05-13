class ApiController < ApplicationController
    skip_before_action :verify_authenticity_token
   
    require 'jwt'
    
    def index
        
        token = request.headers["Token"]

        decoded_token = JWT.decode token, nil, false

        user_email = decoded_token[0]['email']

        if decoded_token
            @user = User.find_by_email(user_email)
            #@articles = Article.all
            @articles = @user.articles
            render :json => @articles
        else
            render :json => {'error': 'invaled token'}
            
        end
        # @articles = Article.all
        # @users = User.all
        # puts "my paraams = #{params}"
        # render :json => @articles
    end
    def sign_in

        @user = User.find_by_email(params["api"]["email"])
        valid = @user.valid_password?(params["api"]["password"])
        
        
        if valid
            payload = {'email': params["api"]["email"],
                'password': params["api"]["password"]
            }
            token = JWT.encode payload, nil, 'none'
            render :json =>{token: token}
        else
            render :json => {error: "user is not valid"}
        end
    end
end
