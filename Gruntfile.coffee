module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    coffeelint:
      options:
        no_empty_param_list:
          level: 'error'
        max_line_length:
          level: 'ignore'
        indentation:
          level: 'ignore'

      src: ['lib/*.coffee']
      test: ['spec/*.coffee']
      gruntfile: ['Gruntfile.coffee']

    shell:
      test:
        command: 'node --harmony node_modules/jasmine-focused/bin/jasmine-focused --coffee --captureExceptions --forceexit spec'
        options:
          stdout: true
          stderr: true
          failOnError: true

  grunt.loadNpmTasks('grunt-coffeelint')
  grunt.loadNpmTasks('grunt-shell')

  grunt.registerTask('default', ['test'])
  grunt.registerTask('test', ['coffeelint', 'shell:test'])
