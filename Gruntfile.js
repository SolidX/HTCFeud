module.exports = function (grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        copy:{
            build:{
                cwd: 'src',
                src: ['*.html', '*.php', '*.htm', 'images/*'],
                dest: 'dist',
                expand: true
            }
        },
        clean:{
            build:{
                src: ['dist/*', 'tmp/*']
            }
        },
        useminPrepare: {
            html: 'src/index.php',
            options: {
                dest: 'dist'
            }
        },
        cssmin: {
            build: {
                dest: 'dist/app.css',
                src: 'tmp/app.css'
            }
        },
        uglify: {
            build: {
                options: {
                    preserveComments: 'some'
                },
                files: [{
                    dest: 'dist/app.js',
                    src: 'src/js/*.js'
                }]                
            }
        },
        concat: {
            build: {
                dest: 'tmp/app.css',
                src: 'src/css/*.css'
            }
        },
        usemin: {
            html: 'dist/index.php'
      }
    });
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-usemin');
    
    grunt.registerTask(
        'build',
        'Compiles all the assets and copies the files to the build directory.',
        [ 'clean', 'copy', 'concat', 'uglify', 'cssmin', 'usemin' ]
    );
};