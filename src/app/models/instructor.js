const db = require('../../config/db')
const { age, date } = require("../../lib/utils")


module.exports = {
    all(callback) {

        db.query(`  select instructors.*, count(members) AS total_students
        from instructors 
        left join members on (members.instructor_id = instructors.id)
        group by instructors.id 
        ORDER BY total_students desc `, function (err, results){
            if(err) throw `Database Error! ${err}`
            callback(results.rows)

        })

    },
    create(data, callback){

        const query = `

        INSERT INTO instructors(
            name,
            avatar_url,
            gender,
            services,
            birth,
            created_at
        ) VALUES ($1, $2, $3, $4, $5, $6)
        RETURNING id
` 
          
  const values = [
    data.name,
    data.avatar_url,
    data.gender,
    data.services,
    date(data.birth).iso,
    date(Date.now()).iso
 ]

 db.query(query, values, function(err, results){
    if(err) throw `Database Error! ${err}`
    callback(results.rows[0])
 })

    },

    find(id, callback){
        db.query("Select * from instructors where id = $1", [id], function(err, results){
            if(err) throw `Database Error! ${err}`
            callback(results.rows[0])
        })
    },
    findBy(filter, callback){
        db.query(`  select instructors.*, count(members) AS total_students
        from instructors 
        left join members on (members.instructor_id = instructors.id)
        WHERE instructors.name ILIKE '%${filter}%' 
        OR instructors.services ILIKE '%${filter}%' 
        group by instructors.id 
        ORDER BY total_students desc `, function (err, results){
            if(err) throw `Database Error! ${err}`
            callback(results.rows)

        })
    },
    update(data, callback){

        const query = `
        
        update instructors set 
        avatar_url= ($1),
        name= ($2),
        birth= ($3),
        gender= ($4),
        services= ($5)
        where id = $6
        

        `
        const values = [
            data.avatar_url,
            data.name,
            date(data.birth).iso,
            data.gender,
            data.services,
            data.id
        ]
        db.query(query, values, function(err, results){
            if(err) throw `Database Error! ${err}`

            callback()

        })

    },
    delete(id, callback){
        db.query('Delete from instructors where id = $1', [id], function(err, results){
            if(err) throw `Database Error! ${err}`

            return callback()

        } )

    },
    paginate(params){
        const { filter, limit, offset, callback} = params

        let query = '',
            filterQuery = "",
            totalQuery = ` (
                SELECT count(*) FROM instructors
            ) AS total`

       

        if ( filter ){
            filterQuery = `
            WHERE instructors.name ILIKE '%${filter}%'
            OR instructors.services ILIKE '%${filter}%'
                `
            totalQuery = `(
                select count(*) from instructors  
                ${filterQuery}
                ) AS total`
        }

        query = `SELECT instructors.*, ${totalQuery}, count(members) as total_students 
            from instructors 
            left join members on (instructors.id = members.instructor_id)
            ${filterQuery}
            GROUP by instructors.id LIMIT $1 OFFSET $2
          
            
         `
         

            db.query(query, [limit, offset], function(err, results){
                if (err) throw `DataBase Error! ${err}`

                callback(results.rows)
              
               

            })

        
    }
}