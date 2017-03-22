module App.Messages exposing (Msg(..))

import Http
import Keyboard exposing (..)
import Navigation exposing (Location)
import App.Types exposing (Session, Amishi, Coto, Cotonoma, CotonomaKey)
import Components.ConfirmModal.Messages
import Components.SigninModal
import Components.ProfileModal
import Components.Timeline.Model exposing (Post)
import Components.Timeline.Messages
import Components.CotoModal
import Components.CotonomaModal.Messages


type Msg
    = NoOp
    | OnLocationChange Location
    | NavigationToggle
    | SessionFetched (Result Http.Error Session)
    | CotonomasFetched (Result Http.Error (List Cotonoma))
    | HomeClick
    | CotonomaFetched (Result Http.Error (Cotonoma, List Amishi, List Post))
    | KeyDown KeyCode
    | KeyUp KeyCode
    | ConfirmModalMsg Components.ConfirmModal.Messages.Msg
    | OpenSigninModal
    | SigninModalMsg Components.SigninModal.Msg
    | OpenProfileModal
    | ProfileModalMsg Components.ProfileModal.Msg
    | TimelineMsg Components.Timeline.Messages.Msg
    | CotoModalMsg Components.CotoModal.Msg
    | DeleteCoto Coto
    | CotoDeleted (Result Http.Error String)
    | OpenCotonomaModal
    | CotonomaModalMsg Components.CotonomaModal.Messages.Msg
    | CotonomaClick CotonomaKey