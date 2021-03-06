(** CLASS INVARIANT

    We can define a 'partial class invariant' for any class. The meaning
    of the 'partial class invariant' is that "If your object satisfies
    this property, then there exists a state in which the object will
    honor its specification." Notice that it does not GUARANTEE proper
    operation under all states which satisfy the invariant. In order to
    provide such an absolute guarantee, we would have to fix all aspects
    of the state (all aspects of the configuration), and that would not
    be useful. Remember, our verification efforts can only check that a
    particular fully fixed state behaves as expected, but we cannot, in
    general, verify properties of a non-deterministic state.

    Notice that we do not define conditions under which the class will
    NOT work. Such a proposition would be inconvenient to work with, as
    it would (probably) require use of double negatives, which cannot be
    used in a constructive logic.

    ENVIRONMENT

    It would be convenient if we could create an environment with the
    base language and the [NatRangeIterator] class just by defining a
    new relation which is the union of the 

    Unfortunately, we cannot extend the base language directly by
    defining a new [exec_step] relation through
    [Coq.Relations.Relation_Operators.Union]. *)

(**
OUTLINE

Abstract TODO
Introduction REWORK
Conceptual Foundations DRAFT
Library Overview DRAFT
Example Application TODO
  File Hierarchy TODO
  Assembling a System TODO
  <ENVIRONMENT> TODO
  System Verification TODO
  <NON DETERMINISM> TODO
  Abstract Specifications TODO
    <CLASS INVARIANT> TODO
    Class Invariant TODO
  Application Verification TODO
Proof Automation TODO
Classical Logic DRAFT

INLINE COQDOC
Execution State TODO
  Term TODO
  Stack TODO
  Store TODO
  State TODO
  Execution State TODO
Language Syntax TODO
  Variables and References TODO
  Base Types TODO
  Records TODO
  Objects TODO
    Reference Types TODO
    Value Types TODO
  Operators TODO
  Control Flow TODO
  Function Call TODO
Language Semantics TODO
  Term Reduction
    No Jumps
  Execution Steps TODO
  User Defined Functions and Classes TODO
    Dynamic Binding TODO
  Values TODO

*)
