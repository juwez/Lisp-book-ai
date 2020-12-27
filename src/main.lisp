(require "asdf")
(defpackage lisp
  (:use :cl :split-sequence :iterate :local-time))
(in-package :lisp)
;(ql:quickload :drakma)
;(ql:quickload :zeromq)
;(ql:quickload :hunchentoot)
;(ql:quickload :cl-ppcre)
;(ql:quickload "pzmq")
;(asdf:load-system "hunchtentoot")
;(defclass) TODO make book



(defun hwserver (&optional (listen-address "tcp://*:5555"))
  "Translation of http://zguide.zeromq.org/c:hwserver updated for ZMQ 3. "
  (pzmq:with-context nil ; use *default-context*
    (pzmq:with-socket responder :rep
      (pzmq:bind responder listen-address)
      (loop
        (write-string "Waiting for a request... ")
        (write-line (pzmq:recv-string responder))
        (sleep 1)
        (pzmq:send responder "World")))))

                                        ;(defun getbook()
;(drakma:http-request"https://www.googleapis.com/demo/v1")
                                        ;  (let ((apikey "AIzaSyD7trNqJ10hpu5nT"
;  (cl-ppcre:scan-to-strings 
 ;                          (drakma:http-request "https://www.googleapis.com/books/v1/volumes?q=The+Last+Wish&maxResults=1&key=AIzaSyD7trNqJ10hpu5nT61J6QblwigNryd0fp4"
  ;                                              ))
 ;   )
;  )
