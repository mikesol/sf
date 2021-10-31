import React from "react";
import { transitions, positions, Provider as AlertProvider } from "react-alert";
import AlertTemplate from "react-alert-template-basic";

const options = {
  position: positions.BOTTOM_CENTER,
  timeout: 5000,
  offset: "30px",
  transition: transitions.SCALE,
};

export default function Layout({ children }) {
  return (
    <AlertProvider template={AlertTemplate} {...options}>
      {children}
    </AlertProvider>
  );
}
