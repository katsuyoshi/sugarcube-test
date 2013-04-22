# -*- coding: utf-8 -*-
class AlertViewTableViewController < UITableViewController

  def source
    @source ||= [
        ["simple", :simple],
        ["Little more complex", :little_more_complex],
        ["Full", :full],
        ["Success only", :succes_only],
        ["Append Canel", :append_cancel],
        ["Append OK", :append_ok],
        ["Append Canel and OK", :append_cancel_and_ok]
      ]
  end
  
  def tableView tableView, numberOfRowsInSection:section
    source.size
  end

  CellIdentifier = "Cell"
  def tableView tableView, cellForRowAtIndexPath:indexPath
    cell = tableView.dequeueReusableCellWithIdentifier CellIdentifier, forIndexPath:indexPath
    cell.textLabel.text = source[indexPath.row].first
    cell
  end

  def tableView tableView, didSelectRowAtIndexPath:indexPath
    self.send(source[indexPath.row].last)
    self.tableView.deselectRowAtIndexPath indexPath, animated:true
  end


  # show UIAlertView
  def simple
    UIAlertView.alert "This is happening, OK?" { self.happened! }
  end
  
  def little_more_complex
    UIAlertView.alert("This is happening, OK?", buttons: ["Nevermind", "OK"],
      message: "Don't worry, it'll be fine.") { |button|
      if button == "OK"
        self.happened!
      end
    }
  end
  
  def full
    UIAlertView.alert "I mean, is this cool?", buttons: %w[No! Sure! Hmmmm],
      message: "No going back now",
      cancel: proc { self.cancel },
      success: proc { |pressed| self.proceed if pressed == "Sure!" }
  end
  
  def succes_only
    alert = UIAlertView.alert "Oops.",
      message:"Success only",
      buttons: ['Ok'],
      success: lambda { self.happened! }
  end
  
  def append_cancel
    alert = UIAlertView.alert "No buttons.",
      message:"Does Cancel added?",
      cancel: proc { self.cancel }
  end
  
  def append_ok
    alert = UIAlertView.alert "No buttons.",
      message:"Does OK added?",
      success: lambda { self.happened! }
  end
  
  def append_cancel_and_ok
    alert = UIAlertView.alert "No buttons.",
      message:"Does OK added?",
      cancel: proc { self.cancel },
      success: lambda { self.happened! }
  end
  
  

  
  # callbacks
  def happened!
    p "happened!"
  end

  def cancel
    p "canceled"
  end
  
  def proceed
    p "proceeded"
  end
  
end
