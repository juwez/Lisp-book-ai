(require "asdf")
(defpackage lisp
  (:use :cl :cl-json :for)
  (:export
   :main))
(in-package :lisp)

(defclass book()
  ((title :initarg :title :accessor title)
   (author :initarg :author :accessor author)
   (publisher :initarg :publisher :accessor publisher)
   (category :initarg :category :accessor category)
   (saleability :initarg :saleability :accessor saleability :documentation "this is an indicator as to wether the book is free or not")
   (isebook :initarg :isebook :accessor isebook)
   (isbn :initarg :isbn  :accessor isebook)
   (coverurl :initarg :coverurl :accessor isebook)
   )
  )
(defun main (&optional (listen-address "tcp://*:4242"))
  (write-line "lisp server listening on port 4242")
  (pzmq:with-context nil
    (pzmq:with-socket responder :rep
      (pzmq:bind responder listen-address)
      
      (loop
                  (let ((joske(yason:parse(pzmq:recv-string responder))))
                    (loop for hashnumber in joske
                          do(
                            (write-line (gethash "author" hashnumber))
                             (write-line  (gethash "category" hashnumber))  
                              (write-line (gethash "author" hashnumber))
                              (write-line (gethash "isEbook" hashnumber)) 
                              (write-line (gethash "publisher" hashnumber)) 
                           )
                          )
        )
        (pzmq:send responder (json:encode-json-to-string(make-instance 'book :title "The Witcher - Het Seizoen van Stormen" :author "Andrzej Sapkowski" :publisher "Luitingh Sijthoff Fantasy" :category "Fiction" :saleability "FOR_SALE" :isebook T :isbn "9781473232488" :coverurl "http://books.google.com/books/content?id=H2RIDgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api")))))))
                                        ;(defun getbook()
                                        ;
;(drakma:http-request"https://www.googleapis.com/demo/v1")
                                        ;  (let ((apikey "AIzaSyD7trNqJ10hpu5nT"
;  (cl-ppcre:scan-to-strings 
 ;                          (drakma:http-request "https://www.googleapis.com/books/v1/volumes?q=The+Last+Wish&maxResults=1&key=AIzaSyD7trNqJ10hpu5nT61J6QblwigNryd0fp4"
  ;                                              ))
 ;   )
;  )
