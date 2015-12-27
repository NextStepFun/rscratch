rscratch
========

Ruby implementation of Scratch game

This is an example:

```ruby

window title: "Ruby Scratch!" do

  shaded_background

  add_sprite image: 'cat1-a',
          position: :center, direction: 0 do

   key_pressed key: :up do
      change_y_of -5 
    end

    key_pressed key: :right do
      change_x_of 5 
    end

    key_pressed key: :left do
      change_x_of -5
    end

    key_pressed key: :down do
      change_y_of 5
    end

  end
```

This is how it should look:
![screenshot](https://github.com/RavennaLUG/rscratch/raw/master/media/screenshot.png)


### Installation

* install ruby using [rbenv](https://github.com/sstephenson/rbenv) or [rvm](https://rvm.io/).
* install librsvg (optional but improve sprite rendering)
* install [imagemagick](http://www.imagemagick.org/script/binary-releases.php)
* install other dependencies with:
```
$ bundle install
```

### Examples
More examples can be found at [rscratch-examples](https://github.com/NextStepFun/rscratch-examples).
