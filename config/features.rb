Flipflop.configure do
  # Strategies will be used in the order listed here.
  strategy :cookie
  strategy :active_record
  strategy :default

  # Other strategies:
  #
  # strategy :sequel
  # strategy :redis
  #
  # strategy :query_string
  # strategy :session
  #
  # strategy :my_strategy do |feature|
  #   # ... your custom code here; return true/false/nil.
  # end

  # Declare your features, e.g:
  #
  # feature :world_domination,
  #   default: true,
  #   description: "Take over the world."


  feature :articles,
      default: true,
      description: "Enable All the articles"

  feature :show_hide_signup,
      default: true,
      description: "Enable/Disable Signup Link"
end
