Require Import Software.Lib.Relations.Relations.
Require Import Software.Doc.Example.Specification.Package.NatRangeIterator.
Require Import Software.Doc.Example.System.System1Execution.
Require Import Software.Doc.Example.System.System1Tactics.
Require Import Software.Doc.Example.System.System1Verification.
Require Import Software.Language.State.
Require Import Software.Language.Syntax.
Import ObjectOrientedNotations.

Open Scope oo_scope.
Open Scope exec_scope.

Lemma proof_get_at_start :
  get_at_start exec_step.
Proof.
  unfold get_at_start. intros.
  unfold wf_fun in H.
  destruct H. destruct H0. subst x.
  destruct st as [sk rpsk sr].
  simpl in H1.
  (* Rule out empty stack *)
  destruct sk as [| sf sk].
  { exfalso. apply H1. reflexivity. }
  reduce_clos_refl_trans_term.
  eapply Relation_Operators.rt1n_trans.
    reduce_tcall.
    reduce_value.
    reduce_value.
    reduce_value.
  simpl.
  eapply Relation_Operators.rt1n_trans.
    reduce_treturn.
    reduce_exec_step.
    reduce_called_on_class.
  simpl.
  eapply Relation_Operators.rt1n_trans.
    reduce_treturn.
    reduce_tfield_r.
    reduce_tvar.
  simpl.
  eapply Relation_Operators.rt1n_trans.
    reduce_treturn.
    reduce_tfield_r.
    reduce_read_store.
  simpl.
  eapply Relation_Operators.rt1n_trans.
    reduce_treturn.
    reduce_value.
  simpl.
  apply Relation_Operators.rt1n_refl.
  Qed.

Lemma proof_get_at_start' :
  get_at_start exec_step.
Proof.
  unfold NatRangeIterator.get_at_start. intros.
    unfold wf_fun in H.
  destruct H. destruct H0. subst x.
  destruct st as [sk rpsk sr].
  simpl in H1.
  (* Rule out empty stack *)
  destruct sk as [| sf sk].
  { exfalso. apply H1. reflexivity. }
  reduce_clos_refl_trans_term.
  repeat reduce.
  Qed.

Close Scope exec_scope.
Close Scope oo_scope.

