def findLast? {α : Type} (xs : List α) : Option α := 
  match xs with
   | List.nil => Option.none
   | List.cons x List.nil => Option.some x
   | List.cons _ xs' => findLast? xs'


def nums : (List Nat) := List.cons 4 (List.cons 3 (List.cons 2 List.nil))

#eval findLast? nums

def List.findFirst? { a : Type } (xs : List a) (predicate : a → Bool) : Option a :=
  match xs with
  | List.nil => Option.none
  | List.cons x xs' => Option.some x 
    |>.filter predicate 
    |>.orElse fun _ => (List.findFirst? xs' predicate)


def predicate (x : Nat) : Bool := x < 3

#eval List.findFirst? nums predicate

def Prod.switch { α β : Type } (pair : α × β) : β × α := Prod.mk pair.snd pair.fst

def PetName { α β : Type } := α ⊕ β

def zip {α β : Type } (xs : List α) ( ys : List β) : List ( α × β ) := 
  match xs with
  | List.nil => List.nil
  | List.cons x xs' => 
    match ys with
    | List.nil => List.nil
    | List.cons y ys' => List.cons (x, y) (zip xs' ys') 

def list3 : List Nat := List.cons 1 (List.cons 2 (List.cons 3 List.nil))
def list4to6 : List Nat := List.cons 4 (List.cons 5 (List.cons 6 List.nil))
def empty : List Nat := List.nil
def list1 : List Nat := List.cons 1 List.nil

#eval zip list3 list4to6
#eval zip list3 empty
#eval zip empty list4to6
#eval zip list3 list1

#check List.length
#check Option.guard
#check Option.getD

def isGreaterThan { α : Type } ( this : Nat ) (xs : List α) : Bool := List.length xs > this 


def take {α : Type} (n : Nat) (xs : List α) : List α :=
  match n, xs with
  | 0, _ => []
  | _, [] => []
  | Nat.succ n', x :: xs' => x :: take n' xs'

#eval take 2 list3
