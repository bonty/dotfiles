(require 'recentf-ext)

(custom-set-variables
 '(recentf-max-saved-items 2000)
 '(recentf-auto-cleanup 10)
 '(recentf-exclude '(".recentf" "/\\.git/" "/el-get/" ".loaddefs.el" "COMMIT_EDITMSG" "MERGE_MSG" "PULLREQ_EDITMSG"))
 '(recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list)))

(recentf-mode 1)
