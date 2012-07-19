Shelob - A Static Web Spinner for Gollum Wiki
=============================================

[Website](http://rubyworks.github.com/shelob) /
[Documentation](http://rubydoc.info/rubyworks/shelob) /
[Source Code](http://github.com/rubyworks/shelob) /
[Report Issue](http://github.com/rubyworks/shelob/issues)


## DESCRIPTION

Shelob is a static website generator for creating customizable renditions
of [Gollum](http://github.com/github/gollum) wiki. This can be useful when
you want to maintain a standalone website, but you want to update it through
the Gollum wiki interface, e.g. via GitHub.

Shelob depends on Smeagol, a read-only web server for Gollum.


## INSTALLATION

You can install Shelob with RubyGems:

    $ [sudo] gem install shelob

And then, if you want code highlighting, follow the
[Installation Guide](http://pygments.org/docs/installation) for Pygments.

Ta da! You're ready to go.


## CUSTOMIZING

The first thing you need to do is clone your Gollum wiki repo.

    $ git clone git@github.com:user/user.github.com.git

Of course, you want to customize your site to suit your style. To do this you
need to add some some support files. Use the `init` command to have Shelob
put the default files in place.

    $ cd path/to/wiki
    $ shelob-init

Note, this is practically identical to using `smeagol-init`, so if had already 
done that there is no need to do this.

In your wiki this will add a few files. One of these is `_settings.yml` which you
use to configure Shelob for your site. See SETTINGS below.

There will also be a file called `_layouts/default.html`. Using Mustache
templating use this file to create a custom page layout for your site.
To learn more about the variables available for use in this template see
the [Shelob Wiki](http://github.com/rubyworks/shelob/wiki).

Be sure to add these files to commit these files to your repo. You can just
check these files in and push to the server. It will not effect you Gollum
wiki in any way.


## SETTINGS

The `_settings.yml` file allows you to configure certain behaviors of Shelob.
An example `_settings.yml` file:

    ---
    title: 7R4N5.C0D3
    url: http://trans.github.com
    author: trans
    description:
      Trans Programming Blog

    source_url: http://github.com/trans

    menu:
    - title: Homepage
      href: "/"
    - title: RSS Feed
      href: "/rss.xml"
    - title: Projects
      href: "http://github.com/trans"

See the documentation for more details about each field and others that
are available.


## PREVIEWING

To preview your site via shelob, simply change directories to your Gollum repository
and run `shelob-preview` from the command line:

    $ cd /path/to/repo
    $ shelob-preview

This will run a web server at `http://localhost:4567`. You can change the port
by setting the `--port` or `-p` option on the command line.


## DEPLOYING

If your site can be deployed by pushing to a git repository, Shelob can be 
used to do so.

    $ shelob-deploy


## CONTRIBUTE

Have a great idea for Shelob? Awesome. Fork the repository and add a feature
or fix a bug. There are a couple things I ask:

* Create an appropriately named topic branch that contains your change.
* Please try to provide tests for all code you check in.

Note that Shelob uses QED, Citron and AE for testing. And admittedly the project
is water-falling too much at present. So if you would like to contribute, but
don't have any specific request, writing a few tests would be a great help.


## COPYRIGHTS

Shelob is distributed under the terms of the **BSD-2-Clause** license.

* Copyright 2012 Trans, Rubyworks
* Copyright 2009 Ben Johnson

Please see LICENSE.txt file for details.

