"use strict"

class DaoUsers{

    constructor(pool){
        this.pool  = pool;
    }
    // metodos CRUD para la base de datos 

    createUser(data, callback){
        this.pool.getConnection(function(error, connection){
            if(error){
                callback(new Error("Error de conexion a la base de datos"));
            } else{
                connection.query("INSERT INTO `users`(`email`, `username`, `password`, `profileImg`) VALUES (?, ?, ?, ?)", [ data.email, data.username, data.password, data.profileImg ], function(error, result){
                    if(error){
                        callback(new Error("Error de acceso a la base de datos"));
                    } else{
                        callback(false, result);
                    }
                });
            }
        });

    }

    readUser(email, callback){
        this.pool.getConnection(function(error, connection){
            if(error){
                callback(new Error("Error de conexion a la base de datos"));
            } else{
                connection.query("SELECT username, profileImg as img, date FROM users WHERE email=?", [ email ], function(error, result){
                    if(error){
                        callback(new Error("Error de acceso a la base de datos"));
                    } else{
                        callback(false, result);
                    }
                });
            }
        });
    }

    readAllUsers(callback){
        this.pool.getConnection(function(error, connection){
            if(error){
                callback(new Error("Error de conexion a la base de datos"));
            } else{
                connection.query("SELECT username, profileImg as img, totalScore as rep FROM users", function(error, result){
                    if(error){
                        callback(new Error("Error de acceso a la base de datos"));
                    } else{
                        callback(false, result);
                    }
                });
            }
        });
        
    }
}

module.exports = DaoUsers;