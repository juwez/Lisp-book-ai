(require "asdf")
(defpackage lisp
  (:use :cl :cl-json :split-sequence :iterate :local-time))
(in-package :lisp)
;(ql:quickload :drakma)
;(ql:quickload :zeromq)
;(ql:quickload :hunchentoot)
;(ql:quickload :cl-ppcre)
;(ql:quickload "pzmq")
;(asdf:load-system "hunchtentoot")
;(defclass) TODO make book
(defun main (&optional (listen-address "tcp://127.0.0.1:4242"))
  (pzmq:with-context nil 
    (pzmq:with-socket responder :rep
      (pzmq:bind responder listen-address)
      (loop
        (write-string "Waiting for a request... ")
        (write-line (yason:parse(pzmq:recv-string responder)))
        (write-line"stop")
        (sleep 1)
        (drakma:http-request "http://lisp.org")
        (pzmq:send responder (json:encode-json(drakma:http-request "https://www.googleapis.com/books/v1/volumes?q=witcher&maxResult=1&key=AIzaSyD7trNqJ10hpu5nT61J6QblwigNryd0fp4"))
        )
      )
    )
    )
  )


                                        ;(defun getbook()
;(drakma:http-request"https://www.googleapis.com/demo/v1")
                                        ;  (let ((apikey "AIzaSyD7trNqJ10hpu5nT"
;  (cl-ppcre:scan-to-strings 
 ;                          (drakma:http-request "https://www.googleapis.com/books/v1/volumes?q=The+Last+Wish&maxResults=1&key=AIzaSyD7trNqJ10hpu5nT61J6QblwigNryd0fp4"
  ;                                              ))
 ;   )
;  )
