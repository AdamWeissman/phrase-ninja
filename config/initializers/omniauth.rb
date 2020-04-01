Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
  #, NONE OF THIS IS IMPORTANT, I DON'T KNOW WHY IT WAS THERE.
         #:scope => 'userinfo.email',
        # :skip_jwt => true,
         #:access_type =>  'offline',
         #:prompt =>  'consent'
end

#this was commented out in scope portion calendar, https://www.googleapis.com/auth/calendar, https://www.googleapis.com/auth/calendar.readonly

#alternate guide for setup https://medium.com/@amoschoo/google-oauth-for-ruby-on-rails-129ce7196f35
