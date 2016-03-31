var gulp = require('gulp');
var uglify = require('gulp-uglify');
var concat = require('gulp-concat');

gulp.task('concat', function () {
    function min(src, minFileName, destPath) {
        gulp.src(src).pipe(uglify()).pipe(concat(minFileName)).pipe(gulp.dest(destPath));
    }

    var baseSrcPath = 'D:/2015/2015Projects/twobrother/branch/bussinesShopWx/src/main/webapp/res/seajs/lib/';
    var destDir = 'D:/2015/2015Projects/twobrother/branch/bussinesShopWx/src/main/webapp/res/seajs/lib/min';

    min([baseSrcPath + 'zepto.js'], 'zepto.min.js', destDir);
    min([baseSrcPath + 'fastclick.js'], 'fastclick.min.js', destDir);
    min([baseSrcPath + 'underscore.js'], 'underscore.min.js', destDir);
    min([baseSrcPath + 'backbone.js'], 'backbone.min.js', destDir);
    min([baseSrcPath + 'iscroll-lite.js'], 'iscroll-lite.min.js', destDir);
    min([baseSrcPath + 'jquery.js'], 'jquery.min.js', destDir);


});

gulp.task('default', ['concat']);