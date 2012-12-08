# -*- coding: utf-8 -*-
#
# Copyright (c) 2012 ITO Kiyoharu
#
# This program is free software.
# You can distribute or modify this program under the terms of
# the GNU LGPL, Lesser General Public License version 2.1.
# For details of the GNU LGPL, see the file "COPYING".
#

[
 "nestidx",
 "rowblockfor"
].each {|m|
  if File.file?("review-ext/#{m}.rb")
    Kernel.load File.expand_path("review-ext/#{m}.rb")
  end
}



