def joinStringWith ( inf : String ) ( pref : String ) ( suffix : String ) : String :=
  String.append pref ( String.append inf suffix )

#check joinStringWith
#eval joinStringWith "A" "B" "C"

def volume ( height : Nat ) ( width : Nat ) ( depth: Nat ) : Nat :=
  height * width * depth
