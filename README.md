
#  ScrollView Stretch Header/ Parallax animation in Swift 5

Example of how to create a UIScrollView HeaderView which sticks to the top and stretches when you pull down.

![](ScrollView-Header.gif)

For understanding what I am doing here, you should be familiar with UIScrollView and its delegate methods. You also need to know about UIScrollView contentInset property.

## Getting Started

Set the ScrollView contentInset property:
```swift
@IBOutlet weak var scrView: UIScrollView!

let scrollTopEdgeInsets:CGFloat = 200//scrollView Top insets size
@IBOutlet weak var headerviewHeightConstraint: NSLayoutConstraint!//headerView height constraint

scrView.delegate = self
scrView.layer.cornerRadius = 25
scrView.layer.masksToBounds = true
scrView.contentInset = UIEdgeInsets(top: scrollTopEdgeInsets, left: 0, bottom: 0, right: 0)
```
And then tell the header view to react accordingly depending on the scrollviews content offset:

```swift
func scrollViewDidScroll(_ scrollView: UIScrollView)
{
  let minHeight:CGFloat = 50
  let maxHeight:CGFloat = 250+minHeight
  let yPos = scrView.contentOffset.y
  let newHeaderViewHeight = (maxHeight - yPos)-(maxHeight-minHeight)
  let tempNewHeaderViewHeight = (maxHeight - yPos)-(maxHeight-minHeight)
  let titleValue = newHeaderViewHeight-minHeight

  //set screen title alpha value
  if(titleValue > 0){
    let finalValue = titleValue*100/scrollTopEdgeInsets
    let alphaValue = finalValue/100
    screenTitleLbl.alpha = 1-alphaValue
  }

  //manage header height constraint
  if (newHeaderViewHeight > maxHeight) {
    headerviewHeightConstraint.constant = (max(tempNewHeaderViewHeight, maxHeight)+(minHeight/2))+statusHeight
  } else {
    headerviewHeightConstraint.constant = (max(newHeaderViewHeight, minHeight)+(minHeight/2))+statusHeight
  }
}
```
This is really simple. Check out the code for more.

