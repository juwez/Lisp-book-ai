(require "asdf")
(defpackage lisp
  (:use :cl :cl-json )
  (:export
   :main))
(in-package :lisp)

(defclass book()
  ((title :initarg :title :accessor title)
   (author :initarg :author :accessor author)
   (publisher :initarg :publisher :accessor publisher)
   (category :initarg :category :accessor category)
   (saleability :initarg :saleability :accessor saleability :documentation "this is an indicator as to wether the book is free or not")
   (isebook :initarg :isebook :accessor isebook))) 
(defun main (&optional (listen-address "tcp://127.0.0.1:4242"))
  (pzmq:with-context nil 
    (pzmq:with-socket responder :rep
      (pzmq:bind responder listen-address)
      (loop
        (pzmq:send responder (json:encode-json-to-string(make-instance 'book :title "The Witcher - Het Seizoen van Stormen" :author "Andrzej Sapkowski" :publisher "Luitingh Sijthoff Fantasy" :category "Fiction" :saleability "FOR_SALE" :isebook T ))))))
  )
                                        ;(defun getbook()
;(drakma:http-request"https://www.googleapis.com/demo/v1")
                                        ;  (let ((apikey "AIzaSyD7trNqJ10hpu5nT"
;  (cl-ppcre:scan-to-strings 
 ;                          (drakma:http-request "https://www.googleapis.com/books/v1/volumes?q=The+Last+Wish&maxResults=1&key=AIzaSyD7trNqJ10hpu5nT61J6QblwigNryd0fp4"
  ;                                              ))
 ;   )
;  )
