import React, { useState, useContext, useEffect, useRef } from "react";
import { defineCustomElements as deckDeckGoHighlightElement } from "@deckdeckgo/highlight-code/dist/loader";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { compile } from "../../output/JIT.Compile";
import { PSContext } from "./layout";
import { evalSources } from "../../output/JIT.EvalSources";
import { compileUrl } from "../../output/Config";
import { motion, AnimatePresence } from "framer-motion";
import {
  faPlayCircle,
  faStopCircle,
  faSpinner,
} from "@fortawesome/free-solid-svg-icons";
import { useAlert } from "react-alert";

deckDeckGoHighlightElement();

const LOADING = "LOADING";
const PLAYING = "PLAYING";
const STOPPED = "STOPPED";
const PROGRAMMING_ERROR = "PROGRAMMING_ERROR";
const CODE_ERROR = "CODE_ERROR";

const playCompiled = function (data) {
  return function (errorCb) {
    return function (successCb) {
      return function () {
        var file = evalSources(data)();
        if (file.main && typeof file.main === "function") {
          successCb(file.main)();
        } else {
          errorCb(new Error("Could not find main in file."))();
        }
      };
    };
  };
};

const compileErrorsToText = (errs) => `The following error(s) occurred:

${errs.map(
  (err) =>
    `${err.position ? "On line " + err.position.startLine + ":\n" : ""}${
      err.message + "\n\n"
    }`
)}`;

const renameAsMain = (str) =>
  str
    .split(/\r?\n/)
    .map((e) =>
      e.indexOf("module ") !== -1 && e.indexOf(" where") !== -1
        ? "module Main where"
        : e
    )
    .join("\n");

export const Player = ({ preload, player, code: protoCode, stub }) => {
  const loader = useContext(PSContext);
  const code = renameAsMain(protoCode);
  const [showLoader, setShowLoader] = useState(true);
  const [lastCode, setLastCode] = useState(code);
  const [compileErrorsShowing, setCompileErrorsShowing] = useState(false);
  const [compileErrors, setCompileErrors] = useState([]);
  const codeRef = useRef();
  const alert = useAlert();
  useEffect(() => {
    setTimeout(() => {
      setShowLoader(false);
    }, 1000);
  }, [null]);
  useEffect(() => {
    // prime pump
    // this forces the page to cache all of the tryps resources
    // which makes compilation the first time round faster
    // the downside is that there will be jank if someone plays an example immediately
    // but this is usually not the case
    if (preload) {
      compile({
        code,
        loader,
        compileUrl,
        ourFaultErrorCallback: swallowError,
        yourFaultErrorCallback: swallowError,
        successCallback: (suc) => () => {
          playCompiled(suc.js)(swallowError)(() => () => {})();
        },
      })();
    }
  }, [null]);
  const [playerState, setPlayerState] = useState(STOPPED);
  const [stop, setStop] = useState({ hack: () => {} });
  const playerLoadingCb = () => (cb) => () => {
    setPlayerState(LOADING);
    cb()();
  };
  const swallowError = (err) => () => console.error(err);
  const handleError = (err) => {
    alert.error("Something went wrong. Our fault 🤦 Check the console 🙏", {
      timeout: 2000,
    });
    console.error(err);
  };
  const playerLoadedCb = () => (cb) => () => {
    setPlayerState(PLAYING);
    cb()();
  };
  const playerErrorCb = (err) => () => {
    handleError(err);
  };
  const loaderErrorCb = (err) => () => {
    handleError(err);
  };
  const myPlayer = player(playerLoadingCb)(playerLoadedCb)(playerErrorCb);

  return (
    <div style={{ position: "relative" }}>
      <AnimatePresence>
        {showLoader && (
          <motion.div
            initial={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            style={{
              position: "absolute",
              top: 0,
              zIndex: 1000,
              left: 0,
              width: "100%",
            }}
          >
            <div style={{ position: "relative" }}>
              <div
                style={{
                  position: "absolute",
                  top: 0,
                  left: 0,
                  width: "100%",
                  height: "100%",
                  backgroundImage: "linear-gradient(90deg,#bdc3c7,#2c3e50)",
                }}
              ></div>
              <div>
                <pre>
                  <code>{code}</code>
                </pre>
                <div style={{ height: "28px" }}></div>
              </div>
            </div>
          </motion.div>
        )}
      </AnimatePresence>

      <div>
        {stub && <p style={{ backgroundColor: "red" }}>STUB</p>}
        <deckgo-highlight-code
          line-numbers={playerState === CODE_ERROR}
          editable={true}
          language="haskell"
        >
          <code slot="code" ref={codeRef}>
            {code}
          </code>
        </deckgo-highlight-code>
        <div
          style={{
            display: "flex",
            flexDirection: "row",
            justifyContent: "space-between",
          }}
        >
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
                ? () => {}
                : playerState === PLAYING
                ? () => {
                    setPlayerState(STOPPED);
                    stop.hack();
                    setStop({ hack: () => {} });
                  }
                : () => {
                    if (
                      codeRef.current.innerText === lastCode &&
                      playerState !== CODE_ERROR
                    ) {
                      setStop({ hack: myPlayer() });
                    } else {
                      setLastCode(codeRef.current.innerText);
                      setPlayerState(LOADING);
                      compile({
                        code: codeRef.current.innerText,
                        loader,
                        compileUrl,
                        ourFaultErrorCallback: (err) => () => {
                          handleError(err);
                          setPlayerState(PROGRAMMING_ERROR);
                        },
                        yourFaultErrorCallback: (err) => () => {
                          setCompileErrors(err);
                          setCompileErrorsShowing(false);
                          setPlayerState(CODE_ERROR);
                        },
                        successCallback: (suc) => () => {
                          playCompiled(suc.js)(loaderErrorCb)((plyr) => () => {
                            setStop({
                              hack: plyr(() => (cb) => () => cb()())(
                                playerLoadedCb
                              )(playerErrorCb)(),
                            });
                          })();
                        },
                      })();
                    }
                  }
            }
            size="2x"
          />
          {playerState === CODE_ERROR && (
            <span>
              👾 The code above has errors.{" "}
              <a
                style={{ cursor: "pointer" }}
                onClick={() => {
                  setCompileErrorsShowing(!compileErrorsShowing);
                }}
              >
                {compileErrorsShowing ? "Less info." : "More info."}
              </a>
            </span>
          )}
        </div>
        {playerState === CODE_ERROR && compileErrorsShowing && (
          <deckgo-highlight-code
            terminal={"none"}
            editable={false}
            language="bash"
          >
            <code slot="code">{compileErrorsToText(compileErrors)}</code>
          </deckgo-highlight-code>
        )}
      </div>
    </div>
  );
};
