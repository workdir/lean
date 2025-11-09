-- Another Representation

structure Pos where
  succ ::
  pred : Nat

def Pos.add ( x : Pos ) ( y : Pos ) := Pos.succ ( x.pred + y.pred + 1 )

def Pos.mul ( x : Pos ) ( y : Pos ) := Pos.succ ( ( x.pred + 1 ) * ( y.pred + 1 ) - 1)

def Pos.serialize ( pos : Pos ) : String := toString (pos.pred + 1)

open Pos 

instance : Add Pos where
  add := add

instance : Mul Pos where
  mul := mul

instance : ToString Pos where
  toString := serialize

instance : OfNat Pos ( n + 1 ) where
  ofNat := Pos.succ n

def one : Pos := 1
def two : Pos := one + one
#eval two
#eval two * two

-- Even Numbers

-- HTTP Requests

inductive HttpMethod where 
  | GET
  | POST

open HttpMethod 

instance : ToString HttpMethod where
 toString
  | GET => "GET"
  | POST => "POST"

structure HttpResponse where
  statusCode : Nat
  statusMessage : String
  body : String

instance : ToString HttpResponse where
  toString r := 
    s!"HttpResponse statusCode = {r.statusCode}, statusMessage = \"{r.statusMessage}\", body = \"{r.body}\" }"

class HttpHandler ( m : HttpMethod ) where
  handle : IO HttpResponse

instance : HttpHandler GET where
  handle := pure <| HttpResponse.mk 200 "OK" "Success"

instance : HttpHandler POST where
   handle := do
   IO.println "Simulation POST: creating resource..."
   IO.sleep 500 
   pure <| HttpResponse.mk 201 "Created" "Resource created successfully"


def testHttpMethods : IO Unit :=   do
    IO.println s!"\n --- Testing {GET} ---"
    let response ← HttpHandler.handle GET
    IO.println s!"\n --- {response} ---"
    IO.println s!"\n --- Testing {POST} ---"
    let response ← HttpHandler.handle POST
    IO.println s!"\n --- {response} ---"

#eval testHttpMethods
