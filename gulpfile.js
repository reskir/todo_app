var gulp = require('gulp');
var less = require('gulp-less');
var watch = require('gulp-watch');
var path = require('path');

gulp.task('less', function () {
  return gulp.src('./less/main.less')
    .pipe(less({
      paths: [ path.join(__dirname, 'less', 'includes') ]
    }))
    .pipe(gulp.dest('./public/css/'))
});

gulp.task('watch', function(){
    watch('./less/*.less', function(){
        gulp.start('less')
    })
})



gulp.task('default', ['less', 'watch']);
