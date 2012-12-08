# encoding: utf-8
#
# Copyright (c) 2012 ITO Kiyoharu
#
# This program is free software.
# You can distribute or modify this program under the terms of
# the GNU LGPL, Lesser General Public License version 2.1.
# For details of the GNU LGPL, see the file "COPYING".
#

require 'MeCab'

ReVIEW::Compiler.definline(:nestidx)

class ReVIEW::LATEXBuilder
  def inline_nestidx(str)
    nstr = ''
    str.split('!').each_with_index {|s,i|
      if i == 0
        nstr << yomiatjp(s)
      else
        nstr << '!' + yomiatjp(s, '---')
      end
    }
    return '\index{' + nstr + '}'
  end

  def yomiatjp(str, neststr = '')
    escidxstr = neststr + escape_index(text(str))
    begin
      if @mecab_tagger == nil
        @mecab_tagger = MeCab::Tagger.new("-Oyomi")
      end
      return  escape_index(@mecab_tagger.parse(str).chop) + '@' + escidxstr
    rescue
      return "!!ERROR@" + escidxstr
    end
  end
end
