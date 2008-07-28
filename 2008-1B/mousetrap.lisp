(in-package #:cl-user)

(defun solve (n)
  (declare (optimize speed (safety 0))
           (type (integer 1 1000000) n) )
  (let ((stack (make-array n :element-type '(integer 0 1000000)
                             :initial-element 0))
        (i 0))
    (flet ((skip () (loop
                       do (incf i)
                       when (>= i n) do (setf i 0)
                       until (zerop (aref stack i)))))
      (loop for c from 1 to (1- n)
         do (setf (aref stack i) c)
         (dotimes (s (1+ c)) (skip))))
    (setf (aref stack i) n)
    stack))

(defun problem ()
  (declare (optimize debug))
  (dotimes (i (read))
    (format t "~&Case #~D:" (1+ i))
    (let ((s (solve (read))))
      (dotimes (k (read))
        (format t " ~D" (aref s (1- (read))))))))

(defun problem* (in out)
  (with-open-file (*standard-input* in)
    (with-open-file (*standard-output* out :direction :output)
      (problem))))
