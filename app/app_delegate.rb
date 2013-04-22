class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
    sb = UIStoryboard.storyboardWithName "Storyboard", bundle:nil
    @window.rootViewController = sb.instantiateInitialViewController
    @window.makeKeyAndVisible
    true
  end
end
