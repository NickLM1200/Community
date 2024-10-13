def create
  @admin = Admin.find_by(username: params[:username])

  if !!@admin && @admin.authenticate(params[:protectedPasswd])
    session[:username] = @admin.username
    redirect_to admins_path, notice: "Logged in successgully"
  else 
    message = "Invalid credentials"
    redirect_to adminaccess_path, notice: message
  end
end