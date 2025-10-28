-- proposition, Proofs, and Indexing

abbrev TwoPlusThreeIsFive : Prop := 2 + 3 = 5
abbrev FifteenMinusEightIsSeven : Prop := 15 - 8 = 7

theorem twoPlusThreeIsFive : TwoPlusThreeIsFive := rfl
theorem fifteenMinusEightIsSeven : FifteenMinusEightIsSeven := rfl

-- TwoPlusThreeIsFive cannot be used, cause ... cannot be synthesized ... when Prop is defined using def.
theorem twoPlusThreeIsFiveTactic : TwoPlusThreeIsFive := by
  decide -- grind, simp also work

theorem helloWorldIsSelf : ("Hello, ".append "world") = "Hello, world" := by
  decide

abbrev FiveLessThanEighteen : Prop := 5 < 18

-- conclusion for equality not for Nat
-- theorem fiveLessThanEighteen : FiveLessThanEighteen := rfl

def xs : List Nat := [1,2,3,4,5]

def lookupFifthEntry (xs : List α) (ok: xs.length > 4) : α := xs[4]

def lookupFifthEntry? (xs : List α) : Option α := xs[4]?

#eval lookupFifthEntry xs (by decide)
#eval lookupFifthEntry? xs
