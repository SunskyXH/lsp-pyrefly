;;; lsp-pyrefly.el --- The lsp-mode client for pyrefly -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2025 SunskyXH
;;
;; Author: SunskyXH <sunskyxh@gmail.com>
;; Maintainer: SunskyXH <sunskyxh@gmail.com>
;; Created: December 01, 2025
;; Modified: December 01, 2025
;; Version: 0.0.2
;; Keywords: tools
;; Homepage: https://github.com/SunskyXH/lsp-pyrefly
;; Package-Requires: ((emacs "28.1"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;; LSP Client for the Pyrefly Programming Language.
;;
;;; Code:

(require 'lsp-mode)

(defgroup lsp-pyrefly nil
  "LSP support for Pyrefly."
  :group 'lsp-mode
  :link '(url-link "https://github.com/facebook/pyrefly"))

(defcustom lsp-pyrefly-parallel-jobs 4
  "Number of parallel jobs for the pyrefly language server."
  :group 'lsp-pyrefly
  :type 'integer)

(defcustom lsp-pyrefly-clients-server-command
  `("pyrefly" "lsp" "-j" ,(number-to-string lsp-pyrefly-parallel-jobs))
  "Command to start the pyrefly language server."
  :group 'lsp-pyrefly
  :risky t
  :type '(repeat string))

(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection (lambda () lsp-pyrefly-clients-server-command))
                  :activation-fn (lsp-activate-on "python")
                  :priority -1
                  :add-on? t
                  :server-id 'pyrefly))

(lsp-consistency-check lsp-pyrefly)


(provide 'lsp-pyrefly)
;;; lsp-pyrefly.el ends here
