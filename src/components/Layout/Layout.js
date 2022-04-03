import React from "react";
import Navbar from "./Navbar";
import SearchBar from "./SearchBar";
import Footer from "./Footer";

function Layout(props) {
  return (
    <>
      {props.logged || localStorage.getItem("logged") ? (
        <>
          <Navbar />
          <SearchBar
            searchTerm={props.searchTerm}
            setSearchTerm={props.setSearchTerm}
            filter={props.filter}
            setFilter={props.setFilter}
          />
          <main style={{height: "100%", paddingTop: "138px"}}>
            {props.children}
          </main>
          <Footer />
        </>
      ) : (
        <main style={{height: "100%"}}>{props.children}</main>
      )}
    </>
  );
}

export default Layout;
