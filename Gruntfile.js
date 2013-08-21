module.exports = function(grunt) {

    grunt.initConfig({
        pkg : grunt.file.readJSON('package.json'),

        // Concat
        //concat : {
            //options : {
                //separator : ';'
            //},
            //dist : {
                //// Files to concat
                //src : [],
                //// Destination of files
                //dest : 'dist/<%= pkg.name %>.js'
            //}
        //},

        //uglify : {
            //options : {
                //banner: '/*! <%= pkg.name %> <%= grunt.template.today("dd-mm-yyyy") %> */\n'
            //},
            //dist : {
                //files : {
                    //'dist/<%= pkg.name %>.min.js': ['<%= concat.dist.dest %>']
                //}
            //}
        //},
        
        stylus : {
            compile : {
                files : {
                    'assets/css/style.css' : 'assets/css/style.styl'
                }
            }
        },

        coffee : {
            compile : {
                files : {
                    'assets/js/app.js' : 'assets/js/app.coffee'
                }
            }
        },

        jade : {
            compile : {
                options : {
                    pretty : true
                },
                files : {
                    src : '**/*.jade'
                }
            }
        },

        watch : {
            css : {
                files : '**/*.styl',
                tasks : ['stylus']
            },
            scripts : {
                files : '**/*.coffee',
                tasks : ['coffee']
            }
            //files : ['<%= jade.files %>'],
            //tasks : ['jade']
        }

    });


    grunt.loadNpmTasks('grunt-contrib-jade');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-stylus');
    grunt.loadNpmTasks('grunt-contrib-coffee');

    grunt.registerTask('default',['jade']);

}
