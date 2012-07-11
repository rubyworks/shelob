---
source:
- meta
authors:
- name: Ben Johnson
  email: benbjohnson@yahoo.com
- name: Thomas Sawyer
  email: transfire@gmail.com
copyrights:
- holder: Rubyworks
  year: '2011'
  license: BSD-2-Clause
- holder: Ben Johnson
  year: '2010'
requirements:
- name: smeagol
- name: rack
  version: 1.2~
- name: gollum
  version: 1.3+
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
- uri: git://github.com/rubyworks/smeagol-static.git
  scm: git
  name: upstream
resources:
- uri: http://rubyworks.github.com/smeagol-static
  label: Website
  type: home
- uri: http://github.com/rubyworks/smeagol-static
  label: Source Code
  type: code
- uri: http://rubydoc.info/gems/smeagol-static/frames
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
name: smeagol-static
title: Semagol Static
created: '2010-08-16'
summary: Static site generator extension for Smeagol
description: ! 'Smeagol Static is static site generator built on

  top of Smeagol, the read-only Gollum server.'
organization: rubyworks
version: 0.1.0
date: '2012-07-11'
