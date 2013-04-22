# -*- coding: utf-8 -*-
class MainTableViewController < UITableViewController

  def source
    @source ||= [
        ["UIAlertView", "AlertViewTableViewController"]
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
    sb = UIStoryboard.storyboardWithName "Storyboard", bundle:nil
    c = sb.instantiateViewControllerWithIdentifier source[indexPath.row].last
    self.navigationController << c
  end

end
