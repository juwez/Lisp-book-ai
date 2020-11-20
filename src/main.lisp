(defpackage lisp
  (:use :cl))
(in-package :lisp)
(ql:quickload :hunchentoot)
(ql:quickload :hunchentoot-no-ssl)
(hunchentoot:start (make-instance 'hunchentoot:easy-acceptor :port 4242))
(hunchentoot:define-easy-handler (say-hello:uri "/hi")(name)
  (setf (hunchentoot:content-type*) "text/plain")
  (format nil "hey-@[ ~A~]" name))
