Require Import Coq.Relations.Relations.

Section Relation.

Variable A : Type.
Variable R : relation A.

Definition in_domain (a : A) : Prop :=
  exists a', R a a'.

Definition in_range (a : A) : Prop :=
  exists a', R a' a.

Definition is_function : Prop :=
  forall a b1,
  R a b1 ->
  forall b2,
  R a b2 ->
  b2 = b1.

Lemma clos_refl_trans_termination_is_function:
  forall a b1 b2,
  is_function ->
  ~(in_domain b1) ->
  ~(in_domain b2) ->
  clos_refl_trans A R a b1 ->
  clos_refl_trans A R a b2 ->
  b2 = b1.
Proof.
  intros.
  apply clos_rt_rt1n in H2.
  apply clos_rt_rt1n in H3.
  generalize dependent H3. generalize dependent H1.
  generalize dependent H0. generalize dependent H.
  generalize dependent b2.
  induction H2.
  - intros. inversion H3; subst.
    + reflexivity.
    + exfalso. apply H0. exists y. assumption.
  - intros. inversion H4; subst.
    + exfalso. apply H3. exists y. assumption.
    + apply (H0 x y H y0) in H5. subst y0.
      apply IHclos_refl_trans_1n; try solve [assumption].
  Qed.

End Relation.

