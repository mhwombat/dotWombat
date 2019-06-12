(defvar emacsd-dir "~/.emacs.d/")
(setq package-user-dir (concat emacsd-dir "elpa"))

(package-initialize)

(require 'org)
(require 'ox-html)

(setq org-html-postamble nil)
(setq org-confirm-babel-evaluate nil)

(require 'comint)

(defvar coq-program-name "coqtop")

(defvar coq-buffer)

(define-derived-mode inferior-coq-mode comint-mode "Run Coq"
  ""
  (setq comint-prompt-regexp "^[^<]* < *"))

(defun coq-args-to-list (string)
  (let ((where (string-match "[ \t]" string)))
    (cond ((null where) (list string))
    ((not (= where 0))
     (cons (substring string 0 where)
     (coq-args-to-list (substring string (+ 1 where)
             (length string)))))
    (t (let ((pos (string-match "[^ \t]" string)))
         (if (null pos)
       nil
     (coq-args-to-list (substring string pos
             (length string)))))))))

(defun run-coq (cmd)
  (interactive (list (if current-prefix-arg
       (read-string "Run Coq: " coq-program-name)
       coq-program-name)))
  (if (not (comint-check-proc "*coq*"))
      (let ((cmdlist (coq-args-to-list cmd)))
  (set-buffer (apply 'make-comint "coq" (car cmdlist)
         nil (cdr cmdlist)))
  (inferior-coq-mode)))
  (setq coq-program-name cmd)
  (setq coq-buffer "*coq*")
  (switch-to-buffer "*coq*"))

(defun coq-proc ()
  "Return the current coq process.  See variable `coq-buffer'."
  (let ((proc (get-buffer-process (if (eq major-mode 'inferior-coq-mode)
              (current-buffer)
              coq-buffer))))
    (or proc
  (error "No current process.  See variable `coq-buffer'"))))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((coq . t)))

;; I need to redefine these function, as they have some issues.

(defun org-babel-coq-split-phrases (body)
  (split-string body "\\.[ \t\n\r]+"))

(defun org-babel-coq-run-one-phrase (phrase session)
  (let ((pt (lambda ()
        (marker-position
         (process-mark (get-buffer-process (current-buffer)))))))
    (org-babel-coq-clean-prompt
     (org-babel-comint-in-buffer session
       (let ((start (funcall pt)))
   (with-temp-buffer
     (insert phrase)
     (comint-send-region (coq-proc) (point-min) (point-max))
     (comint-send-string (coq-proc)
      (if (string= (buffer-substring (- (point-max) 1) (point-max)) ".")
    "\n"
        ".\n")))
   (while (equal start (funcall pt)) (sleep-for 0.1))
   (buffer-substring start (funcall pt)))))))

(defun org-babel-execute:coq (body param)
  (let ((full-body (org-babel-expand-body:generic body params))
        (session (org-babel-coq-initiate-session)))
    (let ((phrases (org-babel-coq-split-phrases full-body))
          results)
      (while phrases
        (unless (string-match "^\s*\\'" (car phrases))
          (setq results
                (cons (org-babel-coq-run-one-phrase (car phrases) session) results)))
        (setq phrases (cdr phrases)))
      (apply #'concat (reverse results)))))

(defun org-babel-coq-initiate-session ()
  "Initiate a coq session.
If there is not a current inferior-process-buffer in SESSION then
create one.  Return the initialized session."
  (unless (fboundp 'run-coq)
    (error "`run-coq' not defined, load coq-inferior.el"))
  (save-window-excursion (run-coq coq-program-name))
  (sit-for 0.1)
  (get-buffer org-babel-coq-buffer))

(setq coq-program-name "coqtop -quiet")

