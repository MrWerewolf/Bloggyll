---
layout: default

---

Bloggyll
========

Bloggyll is a minimal [Jekyll][jekyll] theme utilizing [Compass][compass] and
built from the [HTML5 Boilerplate][h5bp].  Many common patterns found in Jekyll
sites are implimented here to get you started with your own site in no time.
This theme is meant to be easy for you to add your own design, but this is
optional.  All you have to do is provide your content.

[![Flattr this git repo](http://api.flattr.com/button/flattr-badge-large.png)](https://flattr.com/submit/auto?user_id=MrWerewolf&url=https://github.com/MrWerewolf/Bloggyll&title=Bloggyll&language=&tags=github&category=software)

Features
--------

* Learn by example with the included posts
* Category pages
* Archive page
* Tag cloud and list page
* Atom feed
* Pagination
* Disqus support
* Google Analytics support
* Code highlighting with [SyntaxHighlighter][highlighter]
* Post excerpts
* Associate files with a post

Themes
------

This is a list of known themes that derive from the base boilerplate theme.
Let me know if you make a public theme and I'll add it to the list.

* **[Bauble][bauble-src]** - A light-hearted and bubbly theme that is loosely reminiscent of the colored glass ornaments (baubles).
* **[Shadow Play 1][shadow-play-1-src]** - Based off the Shadow Play 1 design from [HTML5webtemplates.co.uk](http://www.html5webtemplates.co.uk).
* **[War Room][war-room-src]** - Inspired by the interface to the
ficticious game called *Global Thermonuclear War* from the 1983 film
**WarGames**.

[bauble-src]:https://github.com/MrWerewolf/Bloggyll/tree/Bauble_Theme
[shadow-play-1-src]:https://github.com/MrWerewolf/Bloggyll/tree/Shadow-Play-1_Theme
[war-room-src]:https://github.com/MrWerewolf/Bloggyll/tree/War-Room_Theme

Getting started
---------------

Using Bloggyll is relatively simple.  In these instructions I refer to the
Bloggyll as the **template**.  Also, I assume you have a command line interface
or terminal open in the directory where you have placed your copy of the
template.

### Installing

First you need to [install Jekyll][jekyll-install].

Next, install [Bundler][bundler] by running the following from your command
line:

    gem install bundler

Now you can either clone this template *or* download and extract it to a
folder. Preferably name the folder after your website.

Then, from your command line interface, change directories to the folder with
this template.  Then run the following command:

    bundle install

This will install any gems that this template depends on.

### Installing with RVM

If you're a Linux or Mac OS X user, you can use [RVM][rvm] to manage your Ruby
environments.  Bloggyll comes with an `.rvmrc` that automatically sets up an
isolated environment for itself.  All you need to do is open a terminal window
and change your directory to where you have placed the template.

### Viewing the site

Run the following command:

    jekyll --serve --auto

Then open up your favorite browser and point it to the url:
`http://localhost:4000`

It's important to note that while Jekyll is running with the option `--auto`
any changes you make to your site will automatically be regenerated for you.
The option `--serve` will start a webserver so you can view your site locally
from your browser.

### Configuration

In the template's base directory you'll find the file `_config.yml`.  Open
this file with your favorite text editor.

Some generic settings for your site are included.  You'll want to change these
to suit your site.  It's okay to comment out any of these settings except for
the **url** and **name**.

Here's what each setting means:

* **url** - Full public url without trailing slash.
* **name** - Site name/title.
* **tagline** - Site tagline/subtitle.
* **author** - Site author (most likely you).
* **email** - Site author's email.
* **ga** - Google Analytics ID.  Put your analytics account id from Google here.
  Uncomment to activate.
* **disqus** - Disqus shortname.  Disqus allows you to enable commenting on your
  site.  You need to create an account before you can use this.  Uncomment to
  activate.

The other settings are Jekyll specific and will change how your site gets
generated.  Refer to [Jekyll's configuration documentation][jekyll-conf] if
you would like to change these settings.

### Writing a post

Posts are kept in the `_posts` folder.

To create a post, create a file with the pattern:

    YEAR-MONTH-DAY-title.MARKUP

Your post's extension should typically be either `.markdown` or the shorter
`.md` to specify that your post is formatted using Markdown.
[Markdown][markdown] is a text format syntax that gets converted to html.  You
can think of Markdown as similar to wiki text or bbcode, but Markdown's goal
is to make *both* the text and html representations clean and easy to read.

To get started, create a new text file and name it:

    2012-01-01-Happy_New_Year.md

Open the text file you just created and add the following text to the top:

    ---
    layout: post
    title: Happy New Year!
    ---

The `---` encapsulates your post's metadata, which is formated with
[YAML][yaml]. This little bit of information tells Jekyll that we want to use
the `post` layout (found in the `_layouts` folder) and specify the post's
title as `Happy New Year!`.

After the last `---`, the body of your post begins.  Since we gave it a `.md`
extension our content will be parsed as Markdown.  A [Markdown quick reference
][kram-qref] will help you get started, but for now let's start with something
simple like:

    ---
    layout: post
    title: Happy New Year!
    ---

    It's the new year!  My new year's resolution is to blog with the Jekyll
    using Bloggyll for my website.

Now that your post is created, run `jekyll --serve --auto` and view your site
at `http://localhost:4000/`.  You should find your post on the front page and
if you click on the title, you'll notice that the url is something like:

    /2012/01/01/Happy_New_Year/

The specific url is determined by [Jekyll's permalink
configuration][jekyll-perm].

We can specify other things in the metadata too, like categories and tags.
Let's go ahead and change the metadata to:

    ---
    layout: post
    title: Happy New Year!
    category: Holiday
    tags:
        - New year
        - Celebration
        - Party
    ---

    [...]

This will place our post in the category of `Holiday` and add some tags.  This
template works best when you specify at least one category per post.

When you specify a category, it changes the post's url.  In this case the new
url will be:

    /Holiday/2012/01/01/Happy_New_Year/

To learn more about how Jekyll uses your page metadata, you can look at
Jekyll's documentation on [YAML front matter][jekyll-yaml].

### Launching your site

Run the following command:

    jekyll

Without any options, the `jekyll` command will generate your site.  By default
your generated site is created in a folder named `_site`.

The simplest method to launch your site is to upload the contents of the
`_site` folder to wherever your site is being hosted.

More detailed solutions can be found in [Jekyll's documentation on
deployment][jekyll-deploy].

Styling
-------

Bloggyll uses **Sass** and **Compass** to generate it's CSS.  ***Do not*** edit
the `css/style.css` file directly.

**Sass** is a stylesheet that gets converted to CSS.  Sass adds features that
make styles easier to maintain and develop.  If you are new to working with
Sass, you should visit the [Sass website][sass] to familiarize yourself.

**Compass** is a framework that provides you with a library of common Sass
mixins. The [Compass reference][compass-ref] is a great source of information
while styling your site.

To begin styling, you need to first install [Compass][compass]:

    gem install compass

Next, start Compass with the `watch` command in the template base directory
via:

    compass watch

Then use your favorite text editor to edit the files in the `sass` directory.

Here's a brief description of some key files to get you started:

* `style.sass` - Includes all the partial Sass scripts for your site.  This
ensures only one CSS file gets generated to cut down on requests while keeping
your styles organized into separate files by function.
* `_base.sass` - Includes the libraries required for our Sass scripts and
specifies global variables.  This comes recommended by Compass as part of their
[best practices][compass-best-practices].
* `_layout.sass` - Defines the main shape of your site.

License Info
------------

Copyright (c) 2011 Ryan Seto <mr.werewolf@gmail.com>
Licensed under the MIT license (http://www.opensource.org/licenses/mit-license.php)

Contributing
------------

Feel free to fork this project, send me pull requests, and issues through [the
project's github page][jekyll-boiler].

This project is intended to be forked to create new themes.

[jekyll-boiler]: https://github.com/MrWerewolf/Bloggyll
[jekyll]: http://jekyllrb.com/
[jekyll-install]: https://github.com/mojombo/jekyll/wiki/install
[jekyll-conf]: https://github.com/mojombo/jekyll/wiki/Configuration
[jekyll-deploy]: https://github.com/mojombo/jekyll/wiki/Deployment
[jekyll-perm]: https://github.com/mojombo/jekyll/wiki/Permalinks
[jekyll-yaml]: https://github.com/mojombo/jekyll/wiki/YAML-Front-Matter
[bundler]: http://gembundler.com/
[h5bp]: http://html5boilerplate.com/
[compass]: http://compass-style.org/
[compass-ref]: http://compass-style.org/reference/compass/
[compass-best-practices]: http://compass-style.org/help/tutorials/best_practices/
[highlighter]: http://alexgorbatchev.com/SyntaxHighlighter/
[rvm]: http://beginrescueend.com/
[markdown]: http://daringfireball.net/projects/markdown/
[yaml]: http://en.wikipedia.org/wiki/YAML
[kram-qref]: http://kramdown.rubyforge.org/quickref.html
[sass]: http://sass-lang.com/