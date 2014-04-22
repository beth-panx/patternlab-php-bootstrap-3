module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    less: {
      development: {
        options: {
          compress: false, cleancss: false
        },
        files: {
          "css/style.css": "css/style.less"
        }
      }
    },
    watch: {
        less: {
          files: ["css/style.less", "css/less/*.less"],
          tasks: ["less"]
        }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-contrib-watch');

  // Default task(s).
  grunt.registerTask('default', ['less']);
};