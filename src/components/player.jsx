import React, { useState, useEffect } from "react";
import { defineCustomElements as deckDeckGoHighlightElement } from "@deckdeckgo/highlight-code/dist/loader";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faPlayCircle,
  faStopCircle,
  faSpinner,
} from "@fortawesome/free-solid-svg-icons";
deckDeckGoHighlightElement();

const LOADING = "LOADING";
const PLAYING = "PLAYING";
const STOPPED = "STOPPED";

export const Player = ({ player, code }) => {
  const [playerState, setPlayerState] = useState(STOPPED);
  const [stop, setStop] = useState({hack: () => { } });
  const loadingCb = () => (cb) => () => {
    setPlayerState(LOADING);
    cb()();
  };
  const loadedCb = () => (cb) => () => {
    setPlayerState(PLAYING);
    cb()();
  };
  console.log("stop", stop);
  const errorCb = (err) => () => {
    console.log(err);
  };
  const myPlayer = player(loadingCb)(loadedCb)(errorCb);

  return (
    <div>
      <deckgo-highlight-code editable={true} language="purescript">
        <code slot="code">{code}</code>
      </deckgo-highlight-code>
      <p>
        <FontAwesomeIcon
          icon={
            playerState === LOADING
              ? faSpinner
              : playerState === PLAYING
                ? faStopCircle
                : faPlayCircle
          }
          spin={playerState === LOADING}
          onClick={
            playerState === LOADING
              ? () => { }
              : playerState === PLAYING
                ? () => { setPlayerState(STOPPED); stop.hack(); setStop({ hack: () => { } }); }
                : () => { setStop({ hack: myPlayer() }); }
          }
          size="2x"
        />
      </p>
    </div>
  );
};
