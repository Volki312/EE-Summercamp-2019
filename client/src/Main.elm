module Main exposing (Contact, Model(..), Msg(..), checkContact, contactDecoder, contactListDecoder, getContacts, init, main, subscriptions, update, view, viewContacts)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as JD exposing (Decoder, field, int, list, map4, string)
import List



-- MAIN


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- MODEL


type alias Contact =
    { id : Int
    , name : String
    , number : String
    , email : String
    }


type Model
    = Failure
    | Loading
    | Success (List Contact)


init : () -> ( Model, Cmd Msg )
init _ =
    ( Loading, getContacts )



-- UPDATE


type Msg
    = LoadContacts
    | GotContacts (Result Http.Error (List Contact))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LoadContacts ->
            ( Loading, getContacts )

        GotContacts result ->
            case result of
                Ok contacts ->
                    ( Success contacts, Cmd.none )

                Err _ ->
                    ( Failure, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Phone book" ]
        , viewContacts model
        ]


viewContacts : Model -> Html Msg
viewContacts model =
    case model of
        Failure ->
            div [] [
                p [] [ text "Couldn't load contacts for some reason." ]
                , button [ onClick LoadContacts ] [ text "Try again" ]
            ]

        Loading ->
            text "Loading..."

        Success contacts ->
            div [ id "main" ]
                (List.map viewContact contacts)


viewContact : Contact -> Html Msg
viewContact contact =
    div [ class "contact" ]
        [ div [ class "contact__header" ] [
            h2 [ class "contact__name" ] [ text contact.name ]
            , button [ class "contact__dial" ] [ a [ href ("+" ++ contact.number) ] [ text "DIAL" ] ] ]
        , p [ class "contact__number" ] [a [ ] [ text contact.number ]]
        , p [ class "contact__email" ] [ text contact.email ]
        ]



-- HTTP


getContacts : Cmd Msg
getContacts =
    Http.get
        { url = "http://localhost:9000/contacts"
        , expect = Http.expectJson GotContacts contactListDecoder
        }


contactDecoder : Decoder Contact
contactDecoder =
    map4 Contact
        (field "id" int)
        (field "name" string)
        (field "number" string)
        (field "email" string)


contactListDecoder : Decoder (List Contact)
contactListDecoder =
    list contactDecoder



-- MAYBES


checkContact : Maybe Contact -> Contact
checkContact maybeContact =
    case maybeContact of
        Just contact ->
            contact

        Nothing ->
            { id = 404
            , name = "No contacts to display"
            , number = "098 404 404"
            , email = "get.some@friends.com"
            }
