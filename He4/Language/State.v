Require Import He4.Language.Term.
Require Import Coq.Lists.List.
Require Import He4.Lists.List.

Definition stack_frame : Type := list tm.

Definition stack : Type := list stack_frame.

Definition push (sf : stack_frame) (sk : stack) : stack := @cons stack_frame sf sk.

Definition pop (sk : stack) : stack := @tl stack_frame sk.

Definition sk_write_hd (n : nat) (a : tm) (sk : stack) : stack :=
  push (replace n a (hd nil sk)) (pop sk).

Definition sk_read_hd (n : nat) (sk : stack) : tm :=
  nth n (hd nil sk) tvoid.

Definition sk_resize_hd (n : nat) (sk : stack) : stack :=
  push (resize n (hd nil sk) tvoid) (pop sk).

Definition empty_stack : stack := push nil nil.

(** TODO: Fill in Lemmas *)

Definition store : Type := list tm.

Definition sr_alloc (a : tm) (sr : store) : store :=
  app sr (cons a nil).

Definition sr_write (n : nat) (t : tm) (sr : store) : store := @replace tm n t sr.

Definition sr_read (n : nat) (sr : store) : tm := nth n sr tvoid.

Definition empty_store : store := sr_alloc tvoid nil. (* Position 0 represents the "null" reference *)

(** TODO: Fill in Lemmas *)

Definition state : Type := prod stack store.

Definition empty_state : state := pair empty_stack empty_store.

(** [Arguments] statement with [/] tells tactic [simpl] to unfold these
    functions when arguments before the [/] are provided [[1]].

    [[1]] https://coq.inria.fr/distrib/8.4pl4/refman/Reference-Manual010.html##sec395 *)

Arguments push sf sk /.
Arguments pop sk /.
Arguments sk_write_hd n a sk /.
Arguments sk_read_hd n sk /.
Arguments sk_resize_hd n sk /.
Arguments sr_alloc a sr /.
Arguments sr_write n t sr /.
Arguments sr_read n sr /.

