class SessionsController < ApplicationController
  # The 'new' action renders the login form
  def new
  end

  # The 'create' action processes the login form submission
  def create
    # Find the user by their email address
    user = User.find_by(email: params[:email])

    # Check if the user exists and the password is correct
    if user && user.authenticate(params[:password])
      # If the user is authenticated, set their user ID in the session
      session[:user_id] = user.id
      # Redirect to the root path (or any other desired location)
      redirect_to root_path, notice: "Logged in successfully"
    else
      # If authentication fails, display an error message
      flash.now[:alert] = "Invalid email or password"
      # Render the login form again
      render :new
    end
  end

  # The 'destroy' action logs the user out by clearing the session
  def destroy
    # Clear the user ID from the session
    session[:user_id] = nil
    # Redirect to the root path (or any other desired location)
    redirect_to root_path, notice: "Logged out successfully"
  end
end
