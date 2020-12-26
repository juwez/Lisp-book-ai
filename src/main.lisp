(require "asdf")
(defpackage lisp
  (:use :cl))
(in-package :lisp)
(ql:quickload :drakma)
                                        ;note to self double ( in case i want more vars
;note to self variables in OOP and functional programming are 2 totally seperate things
;everything is a list
;copy to clipboard = v to start selection then "+y
;+apiKey+ AIzaSyD7trNqJ10hpu5nT61J6QblwigNryd0fp4
;TODO set drakma in asdf
;defun (start-server)
;https://www.googleapis.com/books/v1/volumes?q=The Last Wish&maxResults=1&key=AIzaSyD7trNqJ10hpu5nT61J6QblwigNryd0fp4
;(quicklisp:quickload :drakma)
;(ql:quickload "zeromq")
                                        ;(defun getBook
;(drakma:http-request "https://www.googleapis.com/books/v1/volumes?q=The Last Wish&maxResults=1&key=AIzaSyD7trNqJ10hpu5nT61J6QblwigNryd0fp4")
;  )
(defun getbook()
  (let ((apikey "AIzaSyD7trNqJ10hpu5nT61J6QblwigNryd0fp4")))
  (drakma:http-request "https://bethesda.net/en/game/doom")
  0
)
