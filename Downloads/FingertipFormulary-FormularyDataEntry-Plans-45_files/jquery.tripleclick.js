(function($) {
  'use strict';

  $.event.special.tripleclick = {
    setup: function(data, namespaces) {
        var elem = this, $elem = $(elem);
        $elem.bind('click', $.event.special.tripleclick.handler);
    },

    teardown: function(namespaces) {
        var elem = this, $elem = $(elem);
        $elem.unbind('click', $.event.special.tripleclick.handler);
    },

    handler: function(event) {
        var elem = this, $elem = $(elem),
            clicks = $elem.data('clicks') || 0,
            start = $elem.data('startTimeTC') || 0;

        if ((new Date().getTime() - start) >= 300) {
            clicks = 0;
        }
        clicks += 1;
        if (clicks === 1) {
            start = new Date().getTime();
        }
        
        if (clicks === 3) {
          clicks = 0;

          // set event type to "tripleclick"
          event.type = "tripleclick";
          
          // let jQuery handle the triggering of "tripleclick" event handlers
          $.event.handle.apply(this, arguments);
        }
        
        $elem.data({
          clicks: clicks,
          startTimeTC: start
        });
    }  
  };
}(jQuery));