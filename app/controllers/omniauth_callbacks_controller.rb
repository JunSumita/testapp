class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def twitter
        @log_user = LogUser.from_omniauth(request.env["omniauth.auth"].except("extra"))

        if @log_user.persisted?
            flash.notice = "ログインしました！"
            sign_in_and_redirect @log_user
        else
            session["devise.log_user_attributes"] = @log_user.attributes
            redirect_to new_log_user_registration_url
        end
    end
end
