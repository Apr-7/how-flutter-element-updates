#### demo one
statelessWidget

when wen swap the order of the tile widgets in the row, Flutter walks the element tree to see if the skeletal structure is the same
it starts with the row element and then moves to its children. The element tree checks that the new widgets is the same type and key as the old one.
and if so, it updates its reference to the new widget. in this case, the widgets don't have keys, so Flutter just checks the type


#### demo two & demo three
statefulWidget with keys

color information is being stored in the state, not in the widgets themselves
when you swap the order of the two widgets, flutter walks element tree
checks type of the row widget and updates the reference

flutter uses the element tree and its corresponding state to determine what to actually display on the device
tile element checks the corresponding widget and gets the same type -- a tile widget

add key properties to the widget, now if we swap the widgets, the row widgets match like before, but the key of tile element doesn't
match the key of the correponding tile widget, so flutter deactive those elements, moving the references to the tile elements in the element tree, starting with the first one that doesn't match. then flutter looks through the non-match children for an element with the corresponding key, finds the match, updates its reference to the corresponding widget.

so, in summary, keys are usefull if you're modifying the order or number of staple widgets in a collection. Playing animations, displaying data that the user has enterd, and scroll location al involve state.


#### demo four

wrapped colorful tile widgets with padding widgets, left the keys on the tiles

flutter's element-to-widget matching algorithm looks at one level of tree at a time, at first level of children (padding widget), everyting matchs up correctly
at the second level Flutter notices that the key of the tile element doesn't match the key of the widget, SO it deactivates that tile element, droppting those connections.
it creates a new one and initializes a new state
when matching up widgets to elements, Flutter only looks for a key that matches within a particular level in the tree.
