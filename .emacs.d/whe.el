(provide 'whe)

(define-button-type 'source-button
  'action 'go-to-source
  'follow-link t
  'help-echo "Go to source")

(defun find-source-files ()
  "Find all source files below the current directory"
  (setq srcDir (concat amys-launch-directory "/src"))
  (setq testDir (concat amys-launch-directory "/test"))
  (setq files (directory-files-recursively srcDir "^.*\.l?hs$"))
  (append files (directory-files-recursively testDir "^.*\.l?hs$")))

(defun go-to-source (button)
  "Go to the file associated with this button"
  (find-file (button-label button)))

(defun insert-source-button (f)
  "Insert a button that will navigate to a source file"
  (insert-text-button f :type 'source-button)
  (newline))

(defun insert-source-buttons (files)
  "Create buttons for each file in the input list"
  (dolist (s files) (insert-source-button s)))

(defun whe ()
  "Create a buffer named 'whe' with buttons for each source file"
  (interactive)
  (setq b (get-buffer-create "whe"))
  (set-buffer b)
  (insert-source-buttons (find-source-files))
  (set-buffer-modified-p nil)
  (switch-to-buffer b))
