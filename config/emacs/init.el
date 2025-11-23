;;; init.el -*- lexical-binding: t; -*-

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq create-lockfiles nil
      make-backup-files nil)

(auto-save-visited-mode)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(set-face-attribute 'default nil :family "Iosevka Nerd Font" :height 100)
(set-face-attribute 'variable-pitch nil :family "Iosevka Nerd Font" :height 1.0) ; Need to find a font I Like for this.
(set-face-attribute 'fixed-pitch nil :family "Iosevka Nerd Font" :height 1.0)
