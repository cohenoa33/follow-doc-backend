class WelcomeController < ApplicationController
    skip_before_action :authorized, only: %i[index]
    def index

    end
end
