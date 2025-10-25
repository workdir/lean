structure RectangularPrism where 
  height : Float
  width : Float
  depth : Float

def RectangularPrism.volume ( rect : RectangularPrism) : Float :=
  rect.height * rect.width * rect.depth

structure Point where
  x : Float
  y : Float

structure Segment where {
  start Point
  end Point
}
