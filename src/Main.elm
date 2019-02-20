module Main exposing (Msg(..), main, update, view)

import Browser
import Counter
import Html exposing (Html, button, div, p, text)
import Html.Events exposing (onClick)


main =
    Browser.element { init = init, update = update, subscriptions = subscriptions, view = view }


init : () -> ( Model, Cmd Msg )
init _ =
    ( 0 |> Counter.Model |> Model
    , Cmd.none
    )


type Msg
    = CounterMsg Counter.Msg


type alias Model =
    { counterModel : Counter.Model }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CounterMsg counterMsg ->
            let
                ( newCounterModel, _ ) =
                    Counter.update counterMsg model.counterModel
            in
            ( { model | counterModel = newCounterModel }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


view : Model -> Html Msg
view model =
    div []
        [ model.counterModel |> Counter.view |> Html.map CounterMsg
        ]
