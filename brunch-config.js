exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
      joinTo: {
        'js/app.js': /^(web\/static\/js\/(?=app))/,
        'js/result.js': /^(web\/static\/js\/(?=result))/,
        // 'js/components/components.js': /^(web\/static\/vendor\/components)/
        'js/vendor.js': /^(web\/static\/vendor)/
      }
      // To use a separate vendor.js bundle, specify two files path
      // https://github.com/brunch/brunch/blob/stable/docs/config.md#files
      // joinTo: {
      //  'js/app.js': /^(web\/static\/js)/,
      //  'js/vendor.js': /^(web\/static\/vendor)/
      // }
      //
      // To change the order of concatenation of files, explictly mention here
      // https://github.com/brunch/brunch/tree/stable/docs#concatenation
      // order: {
      //   before: [
      //     'web/static/vendor/js/jquery-2.1.1.js',
      //     'web/static/vendor/js/bootstrap.min.js'
      //   ]
      // }
    },
    stylesheets: {
      joinTo: 'css/app.css'
    },
    templates: {
      joinTo: 'js/app.js'
    }
  },

  // Phoenix paths configuration
  paths: {
    // Which directories to watch
    watched: ["web/static", "test/static"],

    // Where to compile files to
    public: "priv/static"
  },

  // Configure your plugins
  plugins: {
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/^(web\/static\/vendor)/]
    },
    // react: {
    //   transformOptions: {
    //     harmony: true,
    //     sourceMap: false,
    //     stripTypes: false
    //   },
    //   babel: false
    // },
    assetsmanager: {
      copyTo: {
        'js' : ['web/static/other/*'],
        'js/components' : ['web/static/components/*']
      }
    }
  }
};
