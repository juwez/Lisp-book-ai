(defpackage lisp
  (:use :cl))
(in-package :lisp)

(format t "hello world~%")
(ql:quickload :hunchentoot)
(hunchentoot:start (make-instance 'hunchentoot:acceptor :port 4242))
