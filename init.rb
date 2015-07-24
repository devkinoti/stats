#Lake pend oreille stats program

#require_relative('lib/..')

APP_ROOT = File.dirname(__FILE__)

$:.unshift(File.join(APP_ROOT,'lib'))
require 'analyst'

analyser = Analyst.new('p.txt')
analyser.launch!