module Components.Navigation exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Keyed
import App.Types exposing (Cotonoma, Amishi)
import App.Model exposing (Model)
import App.Messages exposing (Msg)
import Components.Cotonomas


view : Model -> List (Html Msg)
view model =
    [ div [ id "navigation-content" ]
        [ case model.cotonoma of
            Just cotonoma -> cotonomaNav model.members cotonoma
            Nothing -> div [] []
        , recentCotonomasNav model.cotonomas
        ]
    ]


cotonomaNav : List Amishi -> Cotonoma -> Html Msg
cotonomaNav members cotonoma =
    div [ class "members" ] 
        [ div [ class "navigation-title" ] [ text "Members" ]
        , div [ class "amishi member owner" ]
            [ img [ class "avatar", src cotonoma.owner.avatarUrl ] []
            , span [ class "name" ] [ text cotonoma.owner.displayName ]
            ]
        , Html.Keyed.node
            "div"
            [ class "members" ]
            (List.map 
                (\member -> 
                    ( toString member.id
                    , div [ class "amishi member" ]
                        [ img [ class "avatar", src member.avatarUrl ] []
                        , span [ class "name" ] [ text member.displayName ]
                        ]
                    )
                ) 
                members
            )
        ]
    

recentCotonomasNav : List Cotonoma -> Html Msg
recentCotonomasNav cotonomas =
    div [ class "recent" ]
        [ div [ class "navigation-title" ] [ text "Recent" ]
        , Components.Cotonomas.view cotonomas
        ]