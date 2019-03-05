# Green Notes: Elm

## error advice:
Error: "elm.page is undefined"
Fixed by: Changing the top line of a 
file called 'page.elm' to say  
		_module Page exposing (main)_


## Serving a View. in Elm. COOL. EVAN HAHN.
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

type Msg = Increment | Decrement

view : Int -> Html Msg
view count =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (String.fromInt count) ]
    , button [ onClick Increment ] [ text "+" ]
    ]

If you call view 42 you get something like this:

<div>
  <button>-</button>
  <div>42</div>
  <button>+</button>
</div>



## Speak correctly: Update Fn
How to say the colon line out loud,
"Elm-function-called-blank will do the following with types" MESSAGE, take the MODEL, return a MODEL"
-----where message is a container of all verbs--
^update : Msg -> Model -> Model


## Speak Correctly: Main  
How to say the EQUALS line out loud,
We are 
PASSING “Helloworld” string as a 
parameter to the function "text".  
It gets 
EVALUATED and then
ASSIGN IT to the main function.
https://css-tricks.com/introduction-elm-architecture-build-first-application/

## Declaring
It's not strictly required. Elm DOES infer a bit.
BEST PRACTICE 
says lay out the types wireframe above the function!


Scala
Clojure
Typescript
Dart
...also compile to JS from types.

DOMAINS
deliberatelyvague.com
tigertigerhorsehorse.com
