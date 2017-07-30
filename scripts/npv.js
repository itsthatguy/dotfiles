'use strict';
require("babel/register");

class NpmVersion {
  parse (data) {
    console.log(data);
  }
}

export default new NpmVersion().parse;
