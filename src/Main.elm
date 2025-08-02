module Main exposing (..)

import Browser exposing (..)
import Debug exposing (toString)
import Dict exposing (Dict)
import Html exposing (..)
import Html.Attributes as Attr
import Html.Events exposing (..)
import Json.Decode as Decode


type alias CellContent =
    Int


type alias Sheet =
    Dict String (Dict String CellContent)


type alias Model =
    { row_names : List String
    , column_names : List String
    , cells : Sheet
    , editing : Maybe ( String, String )
    , newRowName : String
    , newColumnName : String
    , message : String
    }


type Msg
    = EditCell String String
    | UpdateCell String String String
    | SaveCell String String
    | CancelEdit
    | AddRow
    | AddColumn
    | UpdateNewRowName String
    | UpdateNewColumnName String
    | DeleteRow String
    | DeleteColumn String


columnNames : Model -> List (Html Msg)
columnNames model =
    List.map
        (\name -> 
            th [ Attr.style "border" "1px solid black", Attr.scope "col" ] 
               [ div [] [ text name ]
               , button [ onClick (DeleteColumn name), Attr.style "font-size" "10px" ] [ text "×" ]
               ]
        )
        model.column_names


headers : Model -> List (Html Msg)
headers model =
    [ tr []
        (th [ Attr.style "border" "1px solid black" ] [ text " " ] :: columnNames model)
    ]


intensityToColor : Int -> String
intensityToColor i =
    case i of
        0 ->
            "#FF0000"

        1 ->
            "#FF4600"

        2 ->
            "#FF8800"

        3 ->
            "#FFAD00"

        4 ->
            "#FFC500"

        5 ->
            "#EEE600"

        6 ->
            "#D5E600"

        7 ->
            "#CFE600"

        8 ->
            "#8CE600"

        9 ->
            "#5EE600"

        _ ->
            "grey"


formatCell : Model -> String -> String -> Html Msg
formatCell model row col =
    let
        isEditing =
            model.editing == Just ( row, col )
    in
    case Dict.get row model.cells of
        Just c ->
            case Dict.get col c of
                Just cellContent ->
                    if isEditing then
                        td
                            [ Attr.style "border" "1px solid black"
                            , Attr.style "background" (intensityToColor cellContent)
                            ]
                            [ input
                                [ Attr.type_ "number"
                                , Attr.min "0"
                                , Attr.max "9"
                                , Attr.value (toString cellContent)
                                , onInput (UpdateCell row col)
                                , onBlur (SaveCell row col)
                                , onEnter (SaveCell row col)
                                , Attr.style "width" "40px"
                                , Attr.style "text-align" "center"
                                ]
                                []
                            ]
                    else
                        td
                            [ Attr.style "border" "1px solid black"
                            , Attr.style "background" (intensityToColor cellContent)
                            , onClick (EditCell row col)
                            , Attr.style "cursor" "pointer"
                            ]
                            [ text (toString cellContent) ]

                Nothing ->
                    if isEditing then
                        td 
                            [ Attr.style "border" "1px solid black"
                            , Attr.style "background" ""
                            ]
                            [ input
                                [ Attr.type_ "number"
                                , Attr.min "0"
                                , Attr.max "9"
                                , Attr.value "0"
                                , onInput (UpdateCell row col)
                                , onBlur (SaveCell row col)
                                , onEnter (SaveCell row col)
                                , Attr.style "width" "40px"
                                , Attr.style "text-align" "center"
                                ]
                                []
                            ]
                    else
                        td 
                            [ Attr.style "border" "1px solid black"
                            , Attr.style "background" ""
                            , onClick (EditCell row col)
                            , Attr.style "cursor" "pointer"
                            ] 
                            [ text " " ]

        Nothing ->
            if isEditing then
                td 
                    [ Attr.style "border" "1px solid black"
                    , Attr.style "background" ""
                    ]
                    [ input
                        [ Attr.type_ "number"
                        , Attr.min "0"
                        , Attr.max "9"
                        , Attr.value "0"
                        , onInput (UpdateCell row col)
                        , onBlur (SaveCell row col)
                        , onEnter (SaveCell row col)
                        , Attr.style "width" "40px"
                        , Attr.style "text-align" "center"
                        ]
                        []
                    ]
            else
                td 
                    [ Attr.style "border" "1px solid black"
                    , Attr.style "background" ""
                    , onClick (EditCell row col)
                    , Attr.style "cursor" "pointer"
                    ] 
                    [ text " " ]


rows : Model -> List (Html Msg)
rows model =
    List.map
        (\r -> 
            tr [] 
               (th [ Attr.style "border" "1px solid black", Attr.scope "row" ] 
                   [ div [] [ text r ]
                   , button [ onClick (DeleteRow r), Attr.style "font-size" "10px" ] [ text "×" ]
                   ] 
                :: List.map (\c -> formatCell model r c) model.column_names)
        )
        model.row_names


tableView : Model -> Html Msg
tableView model =
    div []
        [ h1 [] [ text "Synesthesia Grid" ]
        , div [ Attr.style "margin-bottom" "20px" ]
            [ div []
                [ label [] [ text "New Row: " ]
                , input 
                    [ Attr.value model.newRowName
                    , onInput UpdateNewRowName
                    , Attr.placeholder "Enter row name"
                    ] []
                , button [ onClick AddRow ] [ text "Add Row" ]
                ]
            , div [ Attr.style "margin-top" "10px" ]
                [ label [] [ text "New Column: " ]
                , input 
                    [ Attr.value model.newColumnName
                    , onInput UpdateNewColumnName
                    , Attr.placeholder "Enter column name"
                    ] []
                , button [ onClick AddColumn ] [ text "Add Column" ]
                ]
            , div [ Attr.style "margin-top" "10px", Attr.style "color" "green" ]
                [ text model.message ]
            ]
        , table
            [ Attr.style "border-collapse" "collapse"
            , Attr.style "margin-top" "20px"
            ]
            (headers model ++ rows model)
        , div [ Attr.style "margin-top" "20px", Attr.style "font-size" "12px" ]
            [ text "Click any cell to edit. Use 0-9 for intensity values."
            ]
        ]


initialModel : Model
initialModel =
    { row_names = [ "the sun", "the moon", "truth", "friendship", "intelligence", "coffee", "love", "sex", "sleep", "justice", "thinking" ]
    , column_names = [ "bright", "loud", "spicy", "crunchy", "shrill", "rough", "smooth", "shiny", "bitter" ]
    , cells =
        Dict.fromList
            [ ( "the sun", Dict.fromList [ ( "spicy", 5 ), ( "bright", 8 ) ] )
            , ( "coffee", Dict.fromList [ ( "bitter", 7 ), ( "spicy", 3 ) ] )
            ]
    , editing = Nothing
    , newRowName = ""
    , newColumnName = ""
    , message = ""
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        EditCell row col ->
            { model | editing = Just ( row, col ) }

        UpdateCell row col value ->
            let
                intValue =
                    String.toInt value |> Maybe.withDefault 0
            in
            { model | 
                cells = 
                    Dict.update row 
                        (\maybeRowDict ->
                            case maybeRowDict of
                                Just rowDict ->
                                    Just (Dict.insert col intValue rowDict)
                                Nothing ->
                                    Just (Dict.fromList [ ( col, intValue ) ])
                        ) 
                        model.cells 
            }

        SaveCell row col ->
            { model | editing = Nothing }

        CancelEdit ->
            { model | editing = Nothing }

        AddRow ->
            if String.length model.newRowName > 0 && not (List.member model.newRowName model.row_names) then
                { model | 
                    row_names = model.row_names ++ [ model.newRowName ]
                , newRowName = ""
                , message = "Row added successfully!"
                }
            else
                { model | message = "Please enter a valid row name!" }

        AddColumn ->
            if String.length model.newColumnName > 0 && not (List.member model.newColumnName model.column_names) then
                { model | 
                    column_names = model.column_names ++ [ model.newColumnName ]
                , newColumnName = ""
                , message = "Column added successfully!"
                }
            else
                { model | message = "Please enter a valid column name!" }

        UpdateNewRowName name ->
            { model | newRowName = name }

        UpdateNewColumnName name ->
            { model | newColumnName = name }

        DeleteRow row ->
            { model | 
                row_names = List.filter (\r -> r /= row) model.row_names
            , cells = Dict.remove row model.cells
            , message = "Row deleted!"
            }

        DeleteColumn col ->
            { model | 
                column_names = List.filter (\c -> c /= col) model.column_names
            , cells = Dict.map (\_ rowDict -> Dict.remove col rowDict) model.cells
            , message = "Column deleted!"
            }


-- Helper function for Enter key
onEnter : msg -> Attribute msg
onEnter msg =
    on "keydown"
        (Decode.field "key" Decode.string
            |> Decode.andThen
                (\key ->
                    if key == "Enter" then
                        Decode.succeed msg
                    else
                        Decode.fail "Not Enter"
                )
        )


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = tableView
        , update = update
        }
