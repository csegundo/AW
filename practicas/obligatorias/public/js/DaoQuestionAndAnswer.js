"use strict"


class DaoQuestionAndAnswer{

    constructor(pool){
        this.pool= pool;
    }

    createQuestion(data,callback){
        this.pool.getConnection(function(error, connection){
            if(error){
                callback(new Error("Error de conexion a la base de datos"));
            } else{               
                connection.query("INSERT INTO `questions`(`user`, `title`, `body`) VALUES (?,?,?)",[data.email,data.tittle,data.body] , function(error, result){
                    connection.release();
                    if(error){
                        callback(new Error("Error de acceso a la base de datos"));
                    } else{
                        callback(false, result);
                    }
                });
            }
        });
    }

    updateQuestion(){

    }
   
    readQuestion(){


    }

    // readAllQuestion(callback){
    //     this.pool.getConnection(function(error, connection){
    //         if(error){
    //             callback(new Error("Error de conexion a la base de datos"));
    //         } else{
    //             connection.query(" SELECT `ID`, `user`, `title`, `body`, `date` FROM `questions`", function(error, result){
    //                 if(error){
    //                     callback(new Error("Error de acceso a la base de datos"));
    //                 } else{
    //                     //sacar los tags de la pregunta
    //                     connection.query("SELECT `question`, `tagName` FROM `tags` WHERE question =?",[result.ID],(error,result)=> {

    //                         if(error){
    //                             callback(new Error("Error de acceso a la base de datos"));
    //                         }
    //                         else{
    //                             callback(false, result);
    //                         }

    //                     });
    //                     connection.release();                       
    //                 }
    //             });
    //         }
    //     });
    // }

    deleteQuestion(){

    }

    createAnswer(data,callback){
        this.pool.getConnection(function(error, connection){
            if(error){
                callback(new Error("Error de conexion a la base de datos"));
            } else{               
                connection.query("INSERT INTO `answers`(`user`, `question`) VALUES (?,?)",[data.email,data.id] , function(error, result){
                    connection.release();
                    if(error){
                        callback(new Error("Error de acceso a la base de datos"));
                    } else{
                        callback(false, result);
                    }
                });
            }
        });
    }

    updateAnswer(){

    }

    readAnswer(){

    }

    readAllAnswers(){

    }

    deleteAnswer(){

    }

}

module.exports= DaoQuestionAndAnswer ;