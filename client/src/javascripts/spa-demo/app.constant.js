(function() {
  "use strict";

  angular
    .module("spa-demo")
    .constant("spa-demo.APP_CONFIG", {
      server_url: "http://localhost:3000",

      main_page_html: "spa-demo/pages/main.html",

      cities_html: "spa-demo/cities/cities.html",
 
    });

})();