# vim:ft=coffee :

module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-shell"
  grunt.loadNpmTasks "grunt-coffeelint"
	
  grunt.registerTask "default", "watch"
  grunt.registerTask "lint", "coffeelint:app"
  grunt.registerTask "test", "shell:test"

  grunt.initConfig
    watch:
      coffee:
        files: [
          "**/*.coffee"   # Watch everything
          "!node_modules" # ...except dependencies
        ]
        tasks: ["lint", "test"]
        options:
          atBegin: true

    shell:
      test:
        command: "npm test"
        options:
          stdout: true
          stderr: true

    coffeelint:
      app:
        files:
          src: ['src/**/*.coffee', "Gruntfile.coffee"]
        options:
          force: true
          configFile: "coffeelint.json"
