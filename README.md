jQuery UI Scrollable
====================

A jQuery UI widget that enables monitoring, querying, or changing the scroll position of an element relative to 
a scrolling  container.  Read about the journey to get here on 
my blog post - [benknowscode.com/2013/07/detect-dom-element-scrolled-with-jquery](http://www.benknowscode.com/2013/07/detect-dom-element-scrolled-with-jquery.html)

- **Detect**: Monitors whether target elements scroll in/out of the visible view of a scroll container (not just the window).
Allows configuring a logical size of the container to affect where the target must actually be located before triggering events.
- **Query**: Provides location information identifying where the target element is located relative to the container (top, left, bottom, right).
- **Change**: Enables animated scrolling of the target into the container with any of the built-in jQuery easing options and flexible
positioning settings.

Check out some of the [demos](http://bseth99.github.io/jquery-ui-scrollable/index.html) 

## Usage

Either download the
[Minified](https://raw.github.com/bseth99/jquery-ui-scrollable/master/jquery-ui-scrollable.min.js) or the 
[Full](https://raw.github.com/bseth99/jquery-ui-scrollable/master/jquery-ui-scrollable.js) source and add it
after the normal jQuery UI scripts.  

A scrolling element is either the window or an element with the ````overflow```` style set to
````auto```` or ````scroll````

      $('#myelement').scrollable()
      
This will add myelement to the list of elements being monitored for their scroll position.  If the element scrolls into 
the visible viewport defined by its container, then an ````in```` event is triggered.  When it scrolls out, an
````out```` event is triggered.  Each event is triggered only one time when an element moves in and out of view.

### Options

````direction```` - Determines if monitoring/positioning will occur for either ````both````, ````vertical```` only, or
````horizontal```` only.  Defaults to ````both````.  

      $('#myelement').scrollable({ direction: 'vertical' });
    

````offset```` - Adjust the logical size of the container such that the detection compares to a different
sized box than the physical one displayed in the browser.  Accepts pixels and percentages.  Accepts ```left```,
````top````, ````right````, and ````bottom```` to set each side individually or ````vertical````/````y```` and 
````horizonal````/````x```` which will split the value evenly between the top/bottom and left/right, respectively.
Any missing values will default to zero.  Positive value shrink the box while negative expand it.

      // Adjust the bounds of the top/left side of the detection zone
      $('#myelement').scrollable({ offset: { left: '40%', top: '40%' } });
      
      // Adjust the bounds of the left/right only (20% for each) and leave top/bottom alone
      $('#myelement').scrollable({ offset: { x: '40%' } });      
      
See the [example](http://bseth99.github.io/jquery-ui-scrollable/examples/offset.html) to see how it works.      

### Methods

````position```` - returns an object hash describing the state of the element relative to the scrolling container's
visible viewport:

- ````container```` [Object] - The normalized (after applying ````offset````) left/right/top/bottom points of
the container element.
- ````element```` [Object] - The left/right/top/bottom points of the target element.
- ````inside```` [Boolean] - Is the element inside the defined visible viewport.
- ````outside```` [Boolean] - Is the element outside the defined visible viewport.
- ````left```` [Boolean] - Is the element left of the defined visible viewport.
- ````right```` [Boolean] - Is the element right of the defined visible viewport.
- ````top```` [Boolean] - Is the element above the defined visible viewport.
- ````bottom```` [Boolean] - Is the element below the defined visible viewport.

````goto```` - Scrolls the element into the visible viewport.  Uses jQuery.animate to smooth the transistion.
Takes an optional config object with the following options:

- ````onlyOutside```` - Should the element be scrolled if its already in the visible area.
- ````my```` - Determines the final positioning of the target element relative to the container.
- ````at```` - Determines where the element should be positioned relative to the container.  
See the documentation on [jQuery UI Position](http://api.jqueryui.com/position/) for the format of ````my```` and ````at````.
- ````duration```` - Same options as [jQuery.animate()](http://api.jquery.com/animate/)
- ````easing```` - Accepts all the easing options available in [jQuery UI](http://jqueryui.com/effect/#easing)
- ````complete```` - callback function to execute once animation completes

See the [example](http://bseth99.github.io/jquery-ui-scrollable/examples/goto.html) to experiment
with the positioning options.

### Events

````in```` - triggered when the element scrolls into the defined viewport.

      $('#myelement').scrollable({ 
         in: function ( e, ui ) {
         
            ...
            
         }
      });
      
or 
      
      $('#myelement').on('scrollin', function ( e, ui ) {

            ...
            
      });

````e```` is the original scroll event.

The ````ui```` object contains the following keys:

- ````container```` [jQuery] - The closest scrolling ancestor container of the target element
- ````element```` [jQuery] - The target element
- ````position```` [Object] - The same object hash that is returned by the ````position```` method.


````out```` - triggered when the element scrolls out of the defined viewport.  Same parameters and usage as ````in````.

### Credits

Inspiration and some bits of code are from the following other scroll related projects:

- [github/litera] (https://github.com/litera/jquery-scrollintoview)
- [github/balupton] (https://github.com/balupton/jquery-scrollto)
- [github/flesler] (https://github.com/flesler/jquery.scrollTo)


## License

Copyright (c) 2013 Ben Olson
Licensed under the MIT License
