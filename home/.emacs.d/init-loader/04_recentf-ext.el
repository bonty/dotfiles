(custom-set-variables
 '(recentf-max-saved-items 2000)
 '(recentf-auto-cleanup 600)
 '(recentf-exclude '(".recentf" "/\\.git/" "/el-get/" ".loaddefs.el" "COMMIT_EDITMSG" "MERGE_MSG")))

(run-at-time t 600 'recentf-save-list)
(recentf-mode 1)
