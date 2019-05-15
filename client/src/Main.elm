module Main exposing (Contact, Model, Msg(..), checkContact, contactDecoder, contactListDecoder, init, main, readContacts, subscriptions, update, view, viewBody)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as JD exposing (Decoder, field, map3)
import Json.Encode as JE exposing (Value, encode, object)
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
    { name : String
    , number : String
    , email : String
    }


type alias Form =
    { name : String
    , number : String
    , email : String
    }


type Status
    = Failure
    | Loading
    | Success (List Contact)


type alias Model =
    { status : Status
    , form : Form
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { status = Loading, form = { name = "", number = "", email = "" } }, readContacts )



-- UPDATE


type Msg
    = LoadContacts
    | GotContacts (Result Http.Error (List Contact))
    | Uploaded (Result Http.Error ())
    | Name String
    | Number String
    | Email String
    | SubmitForm Contact


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        form =
            model.form
    in
    case msg of
        LoadContacts ->
            ( { model | status = Loading }, readContacts )

        GotContacts result ->
            case result of
                Ok contacts ->
                    ( { model | status = Success contacts }, Cmd.none )

                Err _ ->
                    ( { model | status = Failure }, Cmd.none )

        Uploaded result ->
            --TODO: refreshirati (tj rerenderati #phonebook) nakon što se kreira novi kontakt
            -- Pripaziti da se ne refreshira kada je failure, zato jer želimo da ostane na failure viewu
            case result of
                Ok _ ->
                    ( { model | status = Loading }, Cmd.none )

                Err _ ->
                    ( { model | status = Failure }, Cmd.none )

        Name name ->
            ( { model | form = { form | name = name } }, Cmd.none )

        Number number ->
            ( { model | form = { form | number = number } }, Cmd.none )

        Email email ->
            ( { model | form = { form | email = email } }, Cmd.none )

        SubmitForm contact ->
            ( model,
            Http.post
            { url = "http://localhost:9000/contacts"
            , body = Http.jsonBody (contactEncoder contact)
            , expect = Http.expectWhatever Uploaded
            })



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div [ id "main" ]
        [ h1 [] [ text "Phone book" ]
        , viewForm model.form
        , viewBody model.status
        ]


viewBody : Status -> Html Msg
viewBody status =
    case status of
        Failure ->
            div [ id "phonebook" ]
                [ p [] [ text "Couldn't load contacts for some reason." ]
                , button [ onClick LoadContacts ] [ text "Try again" ]
                ]

        Loading ->
            text "Loading..."

        Success contacts ->
            div [ id "phonebook" ]
                (List.map viewContact contacts)


viewForm : Form -> Html Msg
viewForm form =
    --Html.form [ method "post", action "http://localhost:9000/contacts"]
    Html.form []
        [ viewInput "text" " Name" form.name Name
        , viewInput "text" " Number" form.number Number
        , viewInput "text" " Email" form.email Email
        , input [ onClick (SubmitForm (assembleContact form.name form.number form.email)), type_ "button", value "+" ]
        []
        ]

viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
    input [ type_ t, placeholder p, value v, onInput toMsg ] []

assembleContact: String -> String -> String -> Contact
assembleContact name number email =
    { name = name
    , number = number
    , email = email
    }

viewContact : Contact -> Html Msg
viewContact contact =
    div [ class "contact" ]
        [ div [ class "contact__header" ]
            [ h2 [ class "contact__name" ] [ text contact.name ]
            , button [ class "contact__dial" ] [ a [ href ("+" ++ contact.number) ] [ text "DIAL" ] ]
            ]
        , p [ class "contact__number" ] [ a [] [ text contact.number ] ]
        , p [ class "contact__email" ] [ text contact.email ]
        ]



-- HTTP


readContacts : Cmd Msg
readContacts =
    Http.get
        { url = "http://localhost:9000/contacts"
        , expect = Http.expectJson GotContacts contactListDecoder
        }


--createContact : Contact -> Cmd Msg
--createContact contact =



contactDecoder : Decoder Contact
contactDecoder =
    map3 Contact
        (field "name" JD.string)
        (field "number" JD.string)
        (field "email" JD.string)


contactListDecoder : Decoder (List Contact)
contactListDecoder =
    JD.list contactDecoder


contactEncoder : Contact -> Value
contactEncoder contact =
    object
        [ ( "name", JE.string contact.name )
        , ( "number", JE.string contact.number )
        , ( "email", JE.string contact.email )
        ]



-- MAYBES


checkContact : Maybe Contact -> Contact
checkContact maybeContact =
    case maybeContact of
        Just contact ->
            contact

        Nothing ->
            { name = "No contacts to display"
            , number = "098 404 404"
            , email = "get.some@friends.com"
            }


checkEmail : Maybe String -> String
checkEmail maybeEmail =
    case maybeEmail of
        Just email ->
            email

        Nothing ->
            ""
