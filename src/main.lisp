(require "asdf")
(defpackage lisp
  (:use :cl))
(in-package :lisp)
(ql:quickload "drakma")
(ql:quickload "zeromq")
(defun start-server() 
  (zmq:with-context (context)
    (zmq:with-socket (socket context :rep)
     (zmq:bind socket "tcp://127.0.0.1:5555") ;TODO afspreken welke socket voor nu local 

      (loop
        (let ((query (make-instance 'zmq:msg)))
          ;waiting for request
          (zmq:recv socket query)
          (format t "received query:'~A'~%"
                  (zmq:msg-data-as-string query)))

        ;here we work with the request
        ;TODO
        ;here we reply
        (let ((reply (make-instance 'zmq:msg :data "OK")))
          (zmq:send socket reply))
        )
      )
    )
  )
(defun test-client()
  (zmq:with-context(context)
    (zmq:with-socket(socket context :rep)
      (zmq:connect socket "tcp://localhost:5555")
      (zmq:send socket(make-instance 'zmq:msg
                                     :data "test"))
      (let ((result(make-instance 'zmq:msg)))
      (zmq:recv socket result)
      (format t "Received string: '~A'~%"
              (zmq:msg-data-as-string result) )
        )
      )
      )
    )
  

;(start-server())
;(defun getbook()
;  (let ((apikey "AIzaSyD7trNqJ10hpu5nT61J6QblwigNryd0fp4")))
;  (drakma:http-request "https://bethesda.net/en/game/doom")
;  0
;)
