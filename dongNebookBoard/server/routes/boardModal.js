var express = require('express');
var router = express.Router();
var oracledb = require('oracledb');
var config = require('../config');


function doRelease(connection){
  connection.release(function (err){
    if(err){
      console.error(err.message);
    }
  })
}
async function getData(){
  var data;
  oracledb.getConnection(config, (err, conn)=>{
    if(err){
      console.error(err.message);
      return;
    }
    conn.execute("select * from book where book_no = 1", [], function(err, result){
      if(err){
        console.error(err.message);
        doRelease(conn);
        
        return;
      }
      data = result;
      console.log("inexecute : ",data);
      doRelease(conn);
    });
  });
  return data;
  
}
router.get('/', function(req, res, next) {
  
  var data = await getData();
  console.log(data);
  res.json({
    addBody: `
      <div class="boardBody"> 
        <div class="boardHeader">
          <p>김종모님</p>
          <img src="`+"../image/test/male-face-12.svg"+`" />
        </div>
        <div class="boardContent">
        <div class="imageContent">
          <img src="`+data[9]+`" alt="book">
        </div>
        <div class="textContent">
          <p>이 책은 너무 재미있어서 5천억번이나 봤습니다.</p> 
          <p>여러분도 꼭보세요!</p>
        </div>
      </div>
        <div class="boardFooter">
          <div class="tagContent">
            <a href="#">`+data[1]+`</a>
          </div>
        </div>
      </div>
      `
  });
});

module.exports = router;
