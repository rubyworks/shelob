---
source:
- meta
authors:
- name: Ben Johnson
  email: benbjohnson@yahoo.com
- name: Thomas Sawyer
  email: transfire@gmail.com
copyrights:
- holder: Ben Johnson
  year: '2010'
- holder: Rubyworks
  year: '2011'
  license: BSD-2-Clause
requirements:
- name: smeagol
- name: sinatra
  version: 1.0~
- name: daemons
  version: 1.1~
- name: citron
  groups:
  - development
  - test
  development: true
- name: ae
  groups:
  - develpoment
  - test
  development: true
- name: rack-test
  groups:
  - development
  - test
  development: true
- name: rdiscount
  groups:
  - development
  - doc
  development: true
dependencies: []
alternatives: []
conflicts: []
repositories:
- uri: git://github.com/rubyworks/shelob.git
  scm: git
  name: upstream
resources:
- uri: http://rubyworks.github.com/shelob
  label: Website
  type: home
- uri: http://github.com/rubyworks/shelob
  label: Source Code
  type: code
- uri: http://rubydoc.info/gems/shelob/frames
  label: Documentation
  type: docs
- uri: http://groups.google.com/groups/rubyworks-mailinglist
  label: Mailing List
  type: mail
categories: []
extra: {}
load_path:
- lib
revision: 0
created: '2010-08-16'
summary: Static site generator for Smeagol/Gollum.
title: Shelob
version: 0.6.0
name: shelob
description: Shelob is a customizable static website spinner for Gollum wiki.
organization: rubyworks
date: '2012-07-18'
