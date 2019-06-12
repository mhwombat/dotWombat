;;
;; Coq
;;

;; Fill column indicator
(add-hook 'coq-mode-hook 'fci-mode)

;; Remove trailing whitespace
(add-hook 'coq-mode-hook 'add-remove-trailing-whitespace-hook)

;; ;;
;; ;; Use pretty Unicode symbols
;; ;;
;; (setq coq-symbols
;;   '(("forall" ?∀)
;;     ("->" ?→)
;;     ("exists" ?∃)
;;     ("=>" ?⇒)
;;     ("False" ?⊥)
;;     ("True" ?⊤)))
;; (add-hook 'coq-mode-hook
;;           (lambda ()
;;             (setq prettify-symbols-alist coq-symbols)))

(defun add-coq-key-bindings-hook ()
  (defhydra hydra-coq (:exit t)
    "coq"
    ("SPC" dabbrev-expand "expand")
    ("RET" proof-goto-point "proof state")
    ;; ("l" agda2-load "load")
    ;; ("q" agda2-quit "quit Agda")
    ;; ("r" agda2-restart "restart Agda")
    ;; ("t" agda2-infer-type-maybe-toplevel "infer type")
    ;; ("c" agda2-make-case "case")
    ;; ("C" agda2-compile "compile")
    ;; ("=" agda2-show-constraints "show constraints")
    ;; ("s" agda2-solve-maybe-all "solve constraints")
    ;; ("?" agda2-show-goals "show goals")
    ;; ("." prop-menu-by-completing-read "context")
    ;; ("<left>" agda2-previous-goal "prev goal")
    ;; ("<right>" agda2-next-goal "next goal")
    ;; ("n" agda2-compute-normalised-maybe-toplevel "normalise")
    ;; ("," agda2-goal-and-context "hole info")
    ;; ("a" agda2-abort "abort command")
    ;; ("G" agda2-remove-annotations "remove goals")
    ;; ("h" agda2-display-implicit-arguments "hide/display hidden args")
    ;; ("o" agda2-module-contents-maybe-toplevel "module contents")
    ;; ("z" agda2-search-about-toplevel "search defn")
    ;; (";" agda2-comment-dwim-rest-of-buffer "(un)comment rest of buffer")
    ;; ("S" agda2-set-program-version "switch Agda version")
    ;; ("g" hydra-agda-goals/body "goals...")
  )
  (local-set-key (kbd "<menu>") 'hydra-coq/body)

  (defhydra hydra-coq-goals (:exit t)
    "goals"
    ;; ("f" agda2-give "fill")
    ;; ("r" agda2-refine "refine")
    ;; ("a" agda2-auto "auto proof search")
    ;; ("c" agda2-make-case "case")
    ;; ("h" agda2-helper-function-type "helper fn type")
    ;; ("t" agda2-goal-type "goal type")
    ;; ("e" agda2-show-context "context")
    ;; ("d" agda2-infer-type-maybe-toplevel "deduce type")
    ;; ("," agda2-goal-and-context "goal type and context")
    ;; ("." agda2-goal-and-context-and-inferred "goal type, context, deferred type")
    ;; (";" agda2-goal-and-context-and-checked "goal type, context, checked term")
    ;; ("n" agda2-compute-normalised-maybe-toplevel "normalise")
  )
)
(add-hook 'coq-mode-hook 'add-coq-key-bindings-hook)

;; Type RET on an entry to view its full documentation.

;; coq-show-proof		      <menu-bar> <Coq> <OTHER QUERIES> <Show Proof>
;;    Command to send Show Proof. to the proof assistant.
;; pg-hide-all-proofs	      M-x ... RET
;;    Hide all completed proofs in the buffer.
;; pg-show-all-proofs	      M-x ... RET
;;    Display all completed proofs in the buffer.
;; proof-activate-scripting      M-x ... RET
;;    Ready prover and activate scripting for the current script buffer.
;; proof-active-buffer-fake-minor-mode M-x ... RET
;;    Toggle active scripting mode in the current buffer.
;; proof-add-completions	      M-x ... RET
;;    Add completions from <PA>-completion-table to completion database.
;; proof-add-favourite	      M-x ... RET
;;    Define and add a "favourite" proof-assisant function to the menu
;;    bar.
;; proof-assert-next-command-interactive <menu-bar> <Proof-General> <Next Step>, C-c C-n
;;    Process until the end of the next unprocessed command after point.
;; proof-assert-until-point-interactive M-x ... RET
;;    Process the region from the end of the locked-region until point.
;; proof-assistant-menu	      M-x ... RET
;;    The menu for Coq
;; proof-auto-raise-toggle	      <menu-bar> <Proof-General> <Quick Options> <Display> <Auto Raise>
;;    Toggle `proof-auto-raise-buffers'. With ARG, turn on iff ARG>0.
;; proof-autosend-toggle	      <menu-bar> <Proof-General> <Quick Options> <Processing> <Process Automatically>, C-c >
;;    Toggle `proof-autosend-enable'. With ARG, turn on iff ARG>0.
;; proof-backward-command	      M-a, <M-up>
;;    (not documented)
;; proof-cd		      M-x ... RET
;;    Change directory to the default directory for the current buffer.
;; proof-colour-locked	      M-x ... RET
;;    Alter the colour of all locked regions according to variable
;;    `proof-colour-locked'.
;; proof-colour-locked-toggle    <menu-bar> <Proof-General> <Quick Options> <Display> <Colour Locked>
;;    Toggle `proof-colour-locked'. With ARG, turn on iff ARG>0.
;; proof-ctxt		      <menu-bar> <Proof-General> <Display Context>, C-c C-t
;;    Show the current context.
;; proof-deactivate-scripting    M-x ... RET
;;    Try to deactivate scripting for the active scripting buffer.
;; proof-del-favourite	      M-x ... RET
;;    Delete "favourite" command recorded at MENUNAME.
;; proof-delete-empty-windows-toggle <menu-bar> <Proof-General> <Quick Options> <Display> <Delete Empty Panes>
;;    Toggle `proof-delete-empty-windows'. With ARG, turn on iff ARG>0.
;; proof-disappearing-proofs-toggle <menu-bar> <Proof-General> <Quick Options> <Display> <Disppearing Proofs>
;;    Toggle `proof-disappearing-proofs'. With ARG, turn on iff ARG>0.
;; proof-display-some-buffers    <menu-bar> <Proof-General> <Buffers> <Rotate Output Buffers>, C-c C-o
;;    Display the reponse, trace, goals, or shell buffer, rotating.
;; proof-display-three-b	      M-x ... RET
;;    Layout three buffers in a single frame.  Only do this if buffers
;;    exist.
;; proof-electric-terminator     M-x ... RET
;;    Insert terminator char, maybe sending the command to the assistant.
;; proof-electric-terminator-toggle <menu-bar> <Proof-General> <Quick Options> <Processing> <Electric Terminator>, <menu-bar> <Coq> <Electric Terminator>
;;    Toggle `proof-electric-terminator-enable'. With ARG, turn on iff
;;    ARG>0.
;; proof-fast-process-buffer-toggle <menu-bar> <Proof-General> <Quick Options> <Processing> <Fast Process Buffer>
;;    Toggle `proof-fast-process-buffer'. With ARG, turn on iff ARG>0.
;; proof-find-theorems	      <menu-bar> <Proof-General> <Find Theorems>, C-c C-f
;;    Search for items containing given constants.
;; proof-forward-command	      M-e, <M-down>
;;    Move forward to the start of the next proof region.
;; proof-frob-locked-end	      C-c C-z
;;    Move the end of the locked region backwards to regain
;;    synchronization.
;; proof-full-annotation-toggle  <menu-bar> <Proof-General> <Quick Options> <Processing> <Full Annotation>
;;    Toggle `proof-full-annotation'. With ARG, turn on iff ARG>0.
;; proof-goals-mode	      M-x ... RET
;;    Mode for goals display.
;; proof-goals-mode-aux-menu     M-x ... RET
;;    Menu for Proof General response buffer.
;; proof-goals-mode-menu	      M-x ... RET
;;    Menu for Proof General goals buffer.
;; proof-goto-command-end	      C-M-e
;;    Set point to end of command at point.
;; proof-goto-command-start      C-M-a
;;    Move point to start of current (or final) command of the script.
;; proof-goto-end-of-locked      <menu-bar> <Proof-General> <Goto Locked End>, C-c C-.
;;    Jump to the end of the locked region, maybe switching to script
;;    buffer.
;; proof-goto-end-of-locked-if-pos-not-visible-in-window M-x ... RET
;;    If the end of the locked region is not visible, jump to the end of
;;    it.
;; proof-goto-end-of-locked-on-error-if-pos-not-visible-in-window M-x ... RET
;;    As `proof-goto-end-of-locked-if-pos-not-visible-in-window', but not
;;    for interrupts.
;; proof-goto-point	      <menu-bar> <Proof-General> <Goto Point>, C-c <C-return>, C-c RET
;;    Assert or retract to the command at current position.
;; proof-help		      C-c C-S-h
;;    Show a help or information message from the proof assistant.
;; proof-imenu-toggle	      <menu-bar> <Proof-General> <Quick Options> <Minor Modes> <Index Menu>
;;    Toggle `proof-imenu-enable'. With ARG, turn on iff ARG>0.
;; proof-indent-line	      M-x ... RET
;;    Indent current line of proof script, if indentation enabled.
;; proof-interrupt-process	      <menu-bar> <Proof-General> <Interrupt Prover>, C-c C-c
;;    Interrupt the proof assistant.  Warning! This may confuse Proof
;;    General.
;; proof-issue-goal	      M-x ... RET
;;    Write a goal command in the script, prompting for the goal.
;; proof-issue-save	      M-x ... RET
;;    Write a save/qed command in the script, prompting for the theorem
;;    name.
;; proof-keep-response-history-toggle M-x ... RET
;;    Toggle `proof-keep-response-history'. With ARG, turn on iff ARG>0.
;; proof-layout-windows	      <menu-bar> <Proof-General> <Buffers> <Layout Windows>, <menu-bar> <Coq> <Refresh Windows Layout>, C-c C-l
;;    Refresh the display of windows according to current display mode.
;; proof-layout-windows-eagerly-toggle <menu-bar> <Proof-General> <Quick Options> <Display> <Layout Eagerly>
;;    Toggle `proof-layout-windows-on-visit-file'. With ARG, turn on iff
;;    ARG>0.
;; proof-maths-menu-enable	      M-x ... RET
;;    Turn on or off maths-menu mode in Proof General script buffer.
;; proof-maths-menu-toggle	      M-x ... RET
;;    Toggle `coq-maths-menu-enable'. With ARG, turn on iff ARG>0.
;; proof-minibuffer-cmd	      <menu-bar> <Proof-General> <Issue Command>, C-c C-v
;;    Send CMD to proof assistant.  Interactively, read from minibuffer.
;; proof-minibuffer-messages-toggle <menu-bar> <Proof-General> <Quick Options> <Display> <Minibuffer Messages>
;;    Toggle `proof-minibuffer-messages'. With ARG, turn on iff ARG>0.
;; proof-mode		      M-x ... RET
;;    Proof General major mode class for proof scripts.
;; proof-mode-menu		      M-x ... RET
;;    The main Proof General menu
;; proof-mouse-goto-point	      <C-M-mouse-3>
;;    Call `proof-goto-point' on the click position EVENT.
;; proof-multiple-frames-toggle  <menu-bar> <Proof-General> <Quick Options> <Display> <Multiple Windows>
;;    Toggle `proof-multiple-frames-enable'. With ARG, turn on iff ARG>0.
;; proof-next-error	      <menu-bar> <Proof-General> <Next Error>, C-c `
;;    Jump to location of next error reported in the response buffer.
;; proof-output-tooltips-toggle  <menu-bar> <Proof-General> <Quick Options> <Display> <Output Tooltips>, <menu-bar> <Coq> <Toggle tooltips>
;;    Toggle `proof-output-tooltips'. With ARG, turn on iff ARG>0.
;; proof-prf		      <menu-bar> <Proof-General> <Display Proof State>, C-c C-p
;;    Show the current proof state.
;; proof-process-buffer	      <menu-bar> <Proof-General> <Use Buffer>, C-c C-b
;;    Process the current (or script) buffer, and maybe move point to the
;;    end.
;; proof-query-identifier	      <menu-bar> <Proof-General> <Identifier Info>, C-c TAB
;;    Query the prover about the identifier STRING.
;; proof-quick-opts-reset	      M-x ... RET
;;    Reset PG Options menu to default (or user-set) values, using
;;    custom.
;; proof-quick-opts-save	      M-x ... RET
;;    Save current values of PG Options menu items using custom.
;; proof-resize-window-tofit     M-x ... RET
;;    Shrink the WINDOW to be as small as possible to display its
;;    contents.
;; proof-response-mode	      M-x ... RET
;;    Responses from Proof Assistant
;; proof-response-mode-menu      M-x ... RET
;;    Menu for Proof General response buffer.
;; proof-retract-buffer	      <menu-bar> <Proof-General> <Retract Buffer>, C-c C-r
;;    Retract the current buffer, and maybe move point to the start.
;; proof-retract-current-goal    M-x ... RET
;;    Retract the current proof, and move point to its start.
;; proof-retract-until-point-interactive M-x ... RET
;;    Tell the proof process to retract until point.
;; proof-save-favourites	      M-x ... RET
;;    Save favourites in customization settings.
;; proof-script-complete	      <menu-bar> <Proof-General> <Advanced> <Complete Identifier>
;;    Like `complete' but case-fold-search set to
;;    `proof-case-fold-search'.
;; proof-script-fly-past-comments-toggle <menu-bar> <Proof-General> <Quick Options> <Processing> <Fly Past Comments>
;;    Toggle `proof-script-fly-past-comments'. With ARG, turn on iff
;;    ARG>0.
;; proof-script-new-command-advance M-x ... RET
;;    Move point to a nice position for a new command, possibly inserting
;;    spaces.
;; proof-script-next-command-advance M-x ... RET
;;    Move point to the beginning of the next command if it's nearby.
;; proof-select-three-b	      M-x ... RET
;;    Put the three buffers B1, B2, and B3 into three windows.
;; proof-set-document-centred    <menu-bar> <Proof-General> <Quick Options> <Display> <Document Centred>
;;    Select options for document-centred working.
;; proof-set-non-document-centred <menu-bar> <Proof-General> <Quick Options> <Display> <Default>
;;    Set options for classic Proof General interaction.
;; proof-settings-reset	      M-x ... RET
;;    Reset proof assistant settings to their default values.
;; proof-settings-save	      M-x ... RET
;;    Save current values of proof assistant settings using Custom.
;; proof-shell-exit	      <menu-bar> <Coq> <Exit Coq>, C-c C-x
;;    Query the user and exit the proof process.
;; proof-shell-mode	      M-x ... RET
;;    Proof General shell mode class for proof assistant processes
;; proof-shell-quiet-errors-toggle	<menu-bar> <Proof-General> <Quick Options> <Processing> <Beep on Errors>
;;    Toggle `proof-shell-quiet-errors'. With ARG, turn on iff ARG>0.
;; proof-shell-restart	      <menu-bar> <Proof-General> <Restart Scripting>
;;    Clear script buffers and send `proof-shell-restart-cmd'.
;; proof-shell-start	      <menu-bar> <Coq> <Start Coq>
;;    Initialise a shell-like buffer for a proof assistant.
;; proof-shrink-windows-tofit-toggle <menu-bar> <Proof-General> <Quick Options> <Display> <Shrink to Fit>
;;    Toggle `proof-shrink-windows-tofit'. With ARG, turn on iff ARG>0.
;; proof-splash-display-screen   <menu-bar> <Proof-General> <Help> <About PG>
;;    Save window config and display Proof General splash screen.
;; proof-splash-message	      M-x ... RET
;;    Make sure the user gets welcomed one way or another.
;; proof-splash-mode	      M-x ... RET
;;    Mode for splash.
;; proof-sticky-errors-toggle    <menu-bar> <Proof-General> <Quick Options> <Display> <Sticky Errors>
;;    Toggle `proof-sticky-errors'. With ARG, turn on iff ARG>0.
;; proof-store-goals-win	      C-c C-a g, <menu-bar> <Coq> <Store Goal>
;;    (not documented)
;; proof-store-response-win      C-c C-a r, <menu-bar> <Coq> <Store Response>
;;    (not documented)
;; proof-strict-read-only	      M-x ... RET
;;    Set spans read-only according to variable `proof-strict-read-only'.
;; proof-submit-bug-report	      <menu-bar> <Proof-General> <Help> <Send Bug Report>
;;    Submit an bug report or other report for Proof General.
;; proof-three-window-toggle     <menu-bar> <Proof-General> <Quick Options> <Display> <Use Three Panes>, <menu-bar> <Coq> <Toggle 3 Windows Mode>
;;    Toggle `proof-three-window-enable'. With ARG, turn on iff ARG>0.
;; proof-toggle-active-scripting <menu-bar> <Proof-General> <Scripting Active>, C-c C-s
;;    Toggle active scripting mode in the current buffer.
;; proof-toolbar-command	      M-x ... RET
;;    Send CMD to proof assistant.  Interactively, read from minibuffer.
;; proof-toolbar-context	      M-x ... RET
;;    Show the current context.
;; proof-toolbar-delete	      M-x ... RET
;;    Undo and delete last successful command at end of locked region.
;; proof-toolbar-find	      M-x ... RET
;;    Search for items containing given constants.
;; proof-toolbar-goal	      M-x ... RET
;;    Write a goal command in the script, prompting for the goal.
;; proof-toolbar-goto	      M-x ... RET
;;    Assert or retract to the command at current position.
;; proof-toolbar-help	      M-x ... RET
;;    (not documented)
;; proof-toolbar-home	      M-x ... RET
;;    Jump to the end of the locked region, maybe switching to script
;;    buffer.
;; proof-toolbar-info	      M-x ... RET
;;    Query the prover about the identifier STRING.
;; proof-toolbar-interrupt	      M-x ... RET
;;    Interrupt the proof assistant.  Warning! This may confuse Proof
;;    General.
;; proof-toolbar-next	      M-x ... RET
;;    Process until the end of the next unprocessed command after point.
;; proof-toolbar-prooftree	      M-x ... RET
;;    Toggle the external proof-tree display.
;; proof-toolbar-qed	      M-x ... RET
;;    Write a save/qed command in the script, prompting for the theorem
;;    name.
;; proof-toolbar-restart	      M-x ... RET
;;    Clear script buffers and send `proof-shell-restart-cmd'.
;; proof-toolbar-retract	      M-x ... RET
;;    Retract the current buffer, and maybe move point to the start.
;; proof-toolbar-setup	      M-x ... RET
;;    Initialize Proof General toolbar and enable it for all PG buffers.
;; proof-toolbar-state	      M-x ... RET
;;    Show the current proof state.
;; proof-toolbar-toggle	      <menu-bar> <Proof-General> <Quick Options> <Display> <Toolbar>, C-c b
;;    Toggle `proof-toolbar-enable'. With ARG, turn on iff ARG>0.
;; proof-toolbar-undo	      M-x ... RET
;;    Undo last successful command at end of locked region.
;; proof-toolbar-use	      M-x ... RET
;;    Process the current (or script) buffer, and maybe move point to the
;;    end.
;; proof-toolbar-visibility      M-x ... RET
;;    Toggle visibility of region under point.
;; proof-tree-external-display-toggle <menu-bar> <Proof-General> <Start/Stop Prooftree>, C-c C-d
;;    Toggle the external proof-tree display.
;; proof-undo-and-delete-last-successful-command <menu-bar> <Proof-General> <Delete Step>, C-c <C-backspace>
;;    Undo and delete last successful command at end of locked region.
;; proof-undo-last-successful-command <menu-bar> <Proof-General> <Undo Step>, C-c C-u
;;    Undo last successful command at end of locked region.
;; proof-undo-last-successful-command-1 M-x ... RET
;;    Undo last successful command at end of locked region.
;; proof-unicode-tokens-enable   M-x ... RET
;;    Turn on or off Unicode tokens mode in Proof General script buffer.
;; proof-unicode-tokens-reconfigure M-x ... RET
;;    Function called after a token configuration is changed.
;; proof-unicode-tokens-toggle   M-x ... RET
;;    Toggle `coq-unicode-tokens-enable'. With ARG, turn on iff ARG>0.
;; proof-universal-keys-only-mode M-x ... RET
;;    Universal keymaps only
;; proof-visit-example-file      M-x ... RET
;;    Visit a standardly named example file for prover PROVER.
;; proofgeneral		      M-x ... RET
;;    Start proof general for prover PROVER.



;; Type RET on an entry to view its full documentation.

;; coq-About		      <menu-bar> <Coq> <OTHER QUERIES> <About...>, C-c C-a C-b, <menu-bar> <Coq> <About...>
;;    Ask for an ident and print information on it.
;; coq-About-with-all	      <menu-bar> <Coq> <OTHER QUERIES> <About...(show all)>
;;    Ask for an ident and print information on it.
;; coq-About-with-implicits      <menu-bar> <Coq> <OTHER QUERIES> <About...(show implicits)>
;;    Ask for an ident and print information on it.
;; coq-Check		      <menu-bar> <Coq> <OTHER QUERIES> <Check...>, C-c C-a C-c, <menu-bar> <Coq> <Check...>
;;    Ask for a term and print its type.
;; coq-Check-show-all	      <menu-bar> <Coq> <OTHER QUERIES> <Check (show all)...>
;;    Ask for a term and print its type.
;; coq-Check-show-implicits      <menu-bar> <Coq> <OTHER QUERIES> <Check (show implicits)...>
;;    Ask for a term and print its type.
;; coq-Compile		      <menu-bar> <Coq> <COQ PROG (ARGS)> <Compile>
;;    Compiles current buffer.
;; coq-Inspect		      <menu-bar> <Coq> <OTHER QUERIES> <Inspect...>
;;    (not documented)
;; coq-LocateConstant	      <menu-bar> <Coq> <OTHER QUERIES> <Locate constant...>, C-c C-a C-l
;;    Locate a constant.
;; coq-LocateLibrary	      <menu-bar> <Coq> <OTHER QUERIES> <Locate Library...>
;;    Locate a library.
;; coq-LocateNotation	      <menu-bar> <Coq> <OTHER QUERIES> <Locate notation...>, C-c C-a C-n
;;    Locate a notation.  Put it automatically into quotes.
;; coq-Print		      <menu-bar> <Coq> <OTHER QUERIES> <Print Implicit...>, <menu-bar> <Coq> <OTHER QUERIES> <Print...>, C-c C-a C-p, <menu-bar> <Coq> <Print...>
;;    Ask for an ident and print the corresponding term.
;; coq-Print-Ltac		      M-x ... RET
;;    Ask for an ident and print the corresponding Ltac term.
;; coq-Print-implicit	      M-x ... RET
;;    Ask for an ident and print the corresponding term.
;; coq-Print-with-all	      <menu-bar> <Coq> <OTHER QUERIES> <Print... (show all)>
;;    Ask for an ident and print the corresponding term.
;; coq-Print-with-implicits      <menu-bar> <Coq> <OTHER QUERIES> <Print... (show implicits)>
;;    Ask for an ident and print the corresponding term.
;; coq-PrintHint		      <menu-bar> <Coq> <INSERT> <Command (menu)> <Open Scope ... Remove Printing Let> <Print Hint>, <menu-bar> <Coq> <OTHER QUERIES> <Print Hint>, C-c C-a h
;;    Command to send Print Hint.  to the proof assistant.
;; coq-PrintScope		      <menu-bar> <Coq> <OTHER QUERIES> <Print Scope/Visibility...>
;;    Show information on notations.  Coq specific.
;; coq-PrintSection	      <menu-bar> <Coq> <OTHER QUERIES> <Print Section...>
;;    (not documented)
;; coq-Pwd			      <menu-bar> <Coq> <OTHER QUERIES> <Pwd>
;;    Display the current Coq working directory.
;; coq-SearchAbout		      <menu-bar> <Coq> <OTHER QUERIES> <SearchAbout (hiding principles)...>, C-c C-a C-a
;;    (not documented)
;; coq-SearchConstant	      <menu-bar> <Coq> <OTHER QUERIES> <Search...>
;;    (not documented)
;; coq-SearchIsos		      <menu-bar> <Coq> <OTHER QUERIES> <SearchPattern...>, C-c C-a C-o
;;    Search a term whose type is isomorphic to given type.
;; coq-SearchRewrite	      <menu-bar> <Coq> <OTHER QUERIES> <SearchRewrite...>
;;    (not documented)
;; coq-Show		      <menu-bar> <Coq> <OTHER QUERIES> <Show ith Goal...>, C-c C-a C-s
;;    Ask for a number I and show the Ith goal.
;; coq-Show-with-all	      <menu-bar> <Coq> <OTHER QUERIES> <Show ith Goal... (show all)>
;;    Ask for a number i and show the ith goal.
;; coq-Show-with-implicits	      <menu-bar> <Coq> <OTHER QUERIES> <Show ith Goal... (show implicits)>
;;    Ask for a number i and show the ith goal.
;; coq-adapt-printing-width      M-x ... RET
;;    Sends a Set Printing Width command to Coq to fit the response
;;    window's WIDTH.
;; coq-adapt-printing-width-and-show M-x ... RET
;;    (not documented)
;; coq-ask-adapt-printing-width-and-show <menu-bar> <Coq> <OPTIONS> <Set Printing Width>, C-c C-a C-w
;;    (not documented)
;; coq-ask-insert-coq-prog-name  <menu-bar> <Coq> <COQ PROG (ARGS)> <Set Coq Prog *persistently*>
;;    Ask for and insert the local variables `coq-prog-name' and
;;    `coq-prog-args'.
;; coq-auto-adapt-printing-width-toggle <menu-bar> <Coq> <Settings> <Auto Adapt Printing Width>
;;    Toggle `coq-auto-adapt-printing-width'. With ARG, turn on iff
;;    ARG>0.
;; coq-autodetect-version	      M-x ... RET
;;    Detect and record the version of Coq currently in use.
;; coq-autotest		      M-x ... RET
;;    (not documented)
;; coq-colon-self-insert	      M-x ... RET
;;    Detect a double hit and act as electric terminator if detected.
;; coq-compile-before-require-toggle <menu-bar> <Coq> <Auto Compilation> <Compile Before Require>
;;    Toggle `coq-compile-before-require'. With ARG, turn on iff ARG>0.
;; coq-compile-keep-going-toggle <menu-bar> <Coq> <Auto Compilation> <Keep going>
;;    Toggle `coq-compile-keep-going'. With ARG, turn on iff ARG>0.
;; coq-compile-parallel-in-background-toggle <menu-bar> <Coq> <Auto Compilation> <Parallel background compilation>
;;    Toggle `coq-compile-parallel-in-background'. With ARG, turn on iff
;;    ARG>0.
;; coq-display-debug-goal	      M-x ... RET
;;    (not documented)
;; coq-double-hit-toggle	      <menu-bar> <Coq> <Double Hit Electric Terminator>
;;    Toggle `coq-double-hit-enable'. With ARG, turn on iff ARG>0.
;; coq-end-Section		      C-c C-a C-)
;;    Ends a Coq section.
;; coq-fold-hyp		      M-x ... RET
;;    Fold hypothesis H's type from the context durably.
;; coq-fold-hyps		      M-x ... RET
;;    Fold the type of hypothesis in LH durably.
;; coq-goals-mode		      M-x ... RET
;;    Major mode derived from `proof-goals-mode' by
;;    `define-derived-mode'.
;; coq-hide-additional-subgoals-toggle <menu-bar> <Coq> <Settings> <Hide Additional Subgoals>
;;    Toggle `coq-hide-additional-subgoals'. With ARG, turn on iff ARG>0.
;; coq-highlight-selected-hyps   M-x ... RET
;;    Highlight all hyps stored in `coq-highlighted-hyps'.
;; coq-id-under-mouse-query      M-x ... RET
;;    Query the prover about the identifier or notation near mouse click
;;    EVENT.
;; coq-insert-as-in-next-command C-c C-a [
;;    (not documented)
;; coq-insert-at-point-hyp-at-mouse M-x ... RET
;;    (not documented)
;; coq-insert-command	      <menu-bar> <Coq> <INSERT> <Command (interactive)>, C-c C-a <C-return>
;;    Ask for a command name, with completion, and insert it at point.
;; coq-insert-intros	      <menu-bar> <Coq> <INSERT> <Tactics (menu)> <functional inversion ... linear> <intros! (guess names)>, <menu-bar> <Coq> <INSERT> <Tactics (menu)> <Intros (smart)>, <menu-bar> <Coq> <INSERT> <Intros (smart)>, C-c C-a TAB
;;    Insert an intros command with names given by Show Intros.
;; coq-insert-match	      <menu-bar> <Coq> <INSERT> <Term (menu)> <forall ... match! (from type)> <match! (from type)>, <menu-bar> <Coq> <INSERT> <Term (menu)> <Match (smart)>, C-c C-a RET
;;    Insert a match expression from a type name by Show Match.
;; coq-insert-requires	      <menu-bar> <Coq> <INSERT> <Require (smart)>, C-c C-a C-r
;;    Insert requires to modules, iteratively.
;; coq-insert-section-or-module  <menu-bar> <Coq> <INSERT> <Command (menu)> <Local Notation (only parsing) ... Open Local Scope> <Module! (interactive)>, <menu-bar> <Coq> <INSERT> <Module/Section (smart)>, C-c C-a C-(
;;    Insert a module or a section after asking right questions.
;; coq-insert-solve-tactic	      C-c C-a !
;;    Ask for a closing tactic name, with completion, and insert at
;;    point.
;; coq-insert-tactic	      <menu-bar> <Coq> <INSERT> <Tactic (interactive)>, C-c C-a C-t
;;    Insert a tactic name at point, with completion.
;; coq-insert-tactical	      <menu-bar> <Coq> <INSERT> <Tactical (interactive)>, C-c C-a t
;;    Ask for a closing tactic name, with completion, and insert at
;;    point.
;; coq-insert-term		      <menu-bar> <Coq> <INSERT> <Term (interactive)>, C-c C-a C-SPC
;;    Ask for a term kind, with completion, and insert it at point.
;; coq-local-vars-list-show-doc  <menu-bar> <Coq> <Help> <help on setting prog name persistently for a file>, <menu-bar> <Coq> <COQ PROG (ARGS)> <help>
;;    (not documented)
;; coq-lock-ancestors-toggle     <menu-bar> <Coq> <Auto Compilation> <Lock Ancesotors>
;;    Toggle `coq-lock-ancestors'. With ARG, turn on iff ARG>0.
;; coq-mode		      M-x ... RET
;;    Major mode for Coq scripts.
;; coq-par-emergency-cleanup     <menu-bar> <Coq> <Auto Compilation> <Abort Background Compilation>
;;    Emergency cleanup for errors in parallel background compilation.
;; coq-printing-depth-intset     <menu-bar> <Coq> <Settings> <Printing Depth>
;;    Set `coq-printing-depth' to ARG.
;; coq-query		      C-c C-a C-q, <menu-bar> <Coq> <Other...>
;;    Ask for a query, with completion, and send to Coq.
;; coq-response-mode	      M-x ... RET
;;    Major mode derived from `proof-response-mode' by
;;    `define-derived-mode'.
;; coq-search-blacklist-stringset <menu-bar> <Coq> <Settings> <Search Blacklist>
;;    Set `coq-search-blacklist' to ARG.
;; coq-set-printing-all	      <menu-bar> <Coq> <OPTIONS> <Set Printing All>
;;    Command to send Set Printing All. to the proof assistant.
;; coq-set-printing-coercions    <menu-bar> <Coq> <OPTIONS> <Set Printing Coercions>
;;    Command to send Set Printing Coercions. to the proof assistant.
;; coq-set-printing-compact-contexts M-x ... RET
;;    Command to send Set Printing Compact Contexts. to the proof
;;    assistant.
;; coq-set-printing-implicit     <menu-bar> <Coq> <OPTIONS> <Set Printing Compact Contexts>, <menu-bar> <Coq> <OPTIONS> <Set Printing Implicit>
;;    Command to send Set Printing Implicit. to the proof assistant.
;; coq-set-printing-synth	      <menu-bar> <Coq> <OPTIONS> <Set Printing Synth>
;;    Command to send Set Printing Synth. to the proof assistant.
;; coq-set-printing-unfocused    <menu-bar> <Coq> <OPTIONS> <Set Printing Unfocused>
;;    Command to send Set Printing Unfocused. to the proof assistant.
;; coq-set-printing-universes    <menu-bar> <Coq> <OPTIONS> <Set Printing Universes>
;;    Command to send Set Printing Universes. to the proof assistant.
;; coq-set-printing-wildcards    <menu-bar> <Coq> <OPTIONS> <Set Printing Wildcards>
;;    Command to send Set Printing Wildcard. to the proof assistant.
;; coq-shell-mode		      M-x ... RET
;;    Major mode derived from `proof-shell-mode' by
;;    `define-derived-mode'.
;; coq-show-conjectures	      <menu-bar> <Coq> <OTHER QUERIES> <Show Conjectures>
;;    Command to send Show Conjectures. to the proof assistant.
;; coq-show-first-goal	      M-x ... RET
;;    Scroll the goal buffer so that the first goal is visible.
;; coq-show-intros		      M-x ... RET
;;    Command to send Show Intros. to the proof assistant.
;; coq-show-proof		      <menu-bar> <Coq> <OTHER QUERIES> <Show Proof>
;;    Command to send Show Proof. to the proof assistant.
;; coq-show-tree		      <menu-bar> <Coq> <OTHER QUERIES> <Show Tree>
;;    Command to send Show Tree. to the proof assistant.
;; coq-show-version	      M-x ... RET
;;    Show the version of Coq currently in use.
;; coq-terminator-insert	      .
;;    A wrapper on `proof-electric-terminator'.
;; coq-time-commands-toggle      <menu-bar> <Coq> <Settings> <Time Commands>
;;    Toggle `coq-time-commands'. With ARG, turn on iff ARG>0.
;; coq-time-indent		      M-x ... RET
;;    (not documented)
;; coq-time-indent-region	      M-x ... RET
;;    (not documented)
;; coq-toggle-fold-hyp	      M-x ... RET
;;    Toggle the hiding status of hypothesis H (asked interactively).
;; coq-toggle-fold-hyp-at	      M-x ... RET
;;    Toggle hiding the hypothesis at point.
;; coq-toggle-fold-hyp-at-mouse  M-x ... RET
;;    Toggle hiding the hypothesis at mouse click.
;; coq-toggle-fold-hyp-at-point  M-x ... RET
;;    (not documented)
;; coq-toggle-highlight-hyp      M-x ... RET
;;    Toggle the highlighting status of hypothesis H.
;; coq-toggle-highlight-hyp-at   M-x ... RET
;;    Toggle hiding the hypothesis at point.
;; coq-toggle-highlight-hyp-at-point M-x ... RET
;;    (not documented)
;; coq-toggle-use-project-file   <menu-bar> <Coq> <COQ PROG (ARGS)> <Use project file>
;;    (not documented)
;; coq-unfold-hyp		      M-x ... RET
;;    Unfold hypothesis H durably.
;; coq-unfold-hyps		      M-x ... RET
;;    Unfold the type of hypothesis in LH durably.
;; coq-unhighlight-selected-hyps M-x ... RET
;;    Unhighlight all hyps stored in `coq-highlighted-hyps'.
;; coq-unset-printing-all	      <menu-bar> <Coq> <OPTIONS> <Unset Printing All>
;;    Command to send Unset Printing All. to the proof assistant.
;; coq-unset-printing-coercions  <menu-bar> <Coq> <OPTIONS> <Unset Printing Coercions>
;;    Command to send Unset Printing Coercions. to the proof assistant.
;; coq-unset-printing-compact-contexts M-x ... RET
;;    Command to send Unset Printing Compact Contexts. to the proof
;;    assistant.
;; coq-unset-printing-implicit   <menu-bar> <Coq> <OPTIONS> <Unset Printing Compact Contexts>, <menu-bar> <Coq> <OPTIONS> <Unset Printing Implicit>
;;    Command to send Unset Printing Implicit. to the proof assistant.
;; coq-unset-printing-synth      <menu-bar> <Coq> <OPTIONS> <Unset Printing Synth>
;;    Command to send Unset Printing Synth. to the proof assistant.
;; coq-unset-printing-unfocused  <menu-bar> <Coq> <OPTIONS> <Unset Printing Unfocused>
;;    Command to send Unset Printing Unfocused. to the proof assistant.
;; coq-unset-printing-universes  <menu-bar> <Coq> <OPTIONS> <Unset Printing Universes>
;;    Command to send Unset Printing Universes. to the proof assistant.
;; coq-unset-printing-wildcards  <menu-bar> <Coq> <OPTIONS> <Unset Printing Wildcards>
;;    Command to send Unset Printing Wildcard. to the proof assistant.
