;; Lancer le man
(defun vectra-man-on-word ()
  "Appelle le man sur le mot pointe par le curseur"
  (interactive)
  (manual-entry (current-word)))

;; yes > y | no > n
(fset 'yes-or-no-p 'y-or-n-p)

(add-hook 'c++-mode-hook '(lambda ()
  (add-hook 'write-contents-hooks 'delete-trailing-whitespace nil t)))
(add-hook   'c-mode-hook '(lambda ()
  (add-hook 'write-contents-hooks 'delete-trailing-whitespace nil t)))
