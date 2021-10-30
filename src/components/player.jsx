import React, { useState, useEffect, useRef } from "react";
import { defineCustomElements as deckDeckGoHighlightElement } from "@deckdeckgo/highlight-code/dist/loader";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { compile } from "../../output/FPSound.Try.Compile";
import {
  faPlayCircle,
  faStopCircle,
  faSpinner,
} from "@fortawesome/free-solid-svg-icons";
deckDeckGoHighlightElement();

const LOADING = "LOADING";
const PLAYING = "PLAYING";
const STOPPED = "STOPPED";
const PROGRAMMING_ERROR = "PROGRAMMING_ERROR";
const CODE_ERROR = "CODE_ERROR";

const evalSources = function (sources) {
  var modules = {};
  function dirname(str) {
    var ix = str.lastIndexOf("/");
    return ix < 0 ? "" : str.slice(0, ix);
  }
  function resolvePath(a, b) {
    if (b[0] === "." && b[1] === "/") {
      return dirname(a) + b.slice(1);
    }
    if (b[0] === "." && b[1] === "." && b[2] === "/") {
      return dirname(dirname(a)) + b.slice(2);
    }
    return b;
  }
  return function load(name) {
    if (modules[name]) {
      return modules[name].exports;
    }
    function require(path) {
      return load(resolvePath(name, path));
    }
    var module = modules[name] = { exports: {} };
    new Function("module", "exports", "require", sources[name])(module, module.exports, require);
    return module.exports;
  };
}

const playCompiled = function (data) {
  return function (errorCb) {
    return function (successCb) {
      return function () {
        var file = evalSources(data)("<file>");
        if (file.main && typeof file.main === "function") {
          successCb(file.main)();
        } else {
          errorCb(new Error("Could not find main in file."))();
        }
      }
    }
  }
}

export const Player = ({ player, code }) => {
  const [lastCode, setLastCode] = useState(code);
  const codeRef = useRef();
  useEffect(() => {
    // prime pump
    // this forces the page to cache all of the tryps resources
    // which makes compilation the first time round faster
    // the downside is that there will be jank if someone plays an example immediately
    // but this is usually not the case
    compile(code)(err => () => {
      console.log(err);
    })(err => () => {
      console.log(err);
    })(suc => () => {
      playCompiled(suc.js)(loaderErrorCb)(() => () => { })()
    })();
  }, [null]);
  const [playerState, setPlayerState] = useState(STOPPED);
  const [stop, setStop] = useState({ hack: () => { } });
  const playerLoadingCb = () => (cb) => () => {
    setPlayerState(LOADING);
    cb()();
  };
  const playerLoadedCb = () => (cb) => () => {
    setPlayerState(PLAYING);
    cb()();
  };
  const playerErrorCb = (err) => () => {
    console.log(err);
  };
  const loaderErrorCb = (err) => () => {
    console.log(err);
  };
  const myPlayer = player(playerLoadingCb)(playerLoadedCb)(playerErrorCb);

  return (
    <div>
      <deckgo-highlight-code onChange={() => console.log("code on change")} codeDidChange={() => console.log("dhc on change")} editable={true} language="purescript">
        <code slot="code" ref={codeRef}>{code}</code>
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
          style={{ cursor: "pointer" }}
          spin={playerState === LOADING}
          onClick={
            playerState === LOADING
              ? () => { }
              : playerState === PLAYING
                ? () => { setPlayerState(STOPPED); stop.hack(); setStop({ hack: () => { } }); }
                : () => {
                  if (codeRef.current.innerText === lastCode) {
                    setStop({ hack: myPlayer() });
                  } else {
                    setLastCode(codeRef.current.innerHTML);
                    setPlayerState(LOADING);
                    compile(codeRef.current.innerHTML)(err => () => {
                      console.log(err);
                      setPlayerState(PROGRAMMING_ERROR);
                    })(err => () => {
                      console.log(err);
                      setPlayerState(CODE_ERROR);
                    })(suc => () => {
                      playCompiled(suc.js)(loaderErrorCb)((plyr) => () => {
                        setStop({ hack: plyr(() => (cb) => () => cb()())(playerLoadedCb)(playerErrorCb)() })
                      })()
                    })();
                  }
                }
          }
          size="2x"
        />
      </p>
    </div>
  );
};
