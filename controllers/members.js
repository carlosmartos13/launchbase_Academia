const fs = require('fs')
const data = require("../data.json")
const { date } = require("../utils")
const Intl = require('intl')

exports.index = function(req, res){
    return res.render("members/index", {members: data.members})

}
// show
exports.show = function(req,res){

    const { id } = req.params

    const foundmember = data.members.find(function(member){
        return member.id == id
    })
    if(!foundmember) return res.send("member not found")

    const today = new Date()

    const member = {
        ...foundmember,
        birth: date(foundmember.birth).birthDate
        

    }

    return res.render("members/show", {member})


}
//create
exports.create =  function(req, res){
    return res.render("members/create")
}
//post
exports.post =  function(req, res){
  
   const keys = Object.keys(req.body)

   for (key of keys){
       if (req.body[key] == "" ){
           return res.send("Please, fill all fields!")
       }
   }




   birth = Date.parse(req.body.birth)
    let id =1
   const LastMamber = data.members[(data.members.length)- 1]
    if (LastMamber){
        id = LastMamber + 1
    }


   data.members.push({
          id, 
       ...req.body,
          birth 
        
   })

   fs.writeFile("data.json", JSON.stringify(data, null, 2), function(err){

        if(err) return res.send("Write file error!")

        return res.redirect("/members")

   })

    // return res.send(req.body)
}
// edit
exports.edit =  function(req, res){
    const { id } = req.params

    const foundmember = data.members.find(function(member){
        return member.id == id
    })
    if(!foundmember) return res.send("member not found")

    const member = {
        ...foundmember,
        birth: date(foundmember.birth).iso
    

    }
    // console.log(`${member.birth}`)

    return res.render('members/edit', { member })
}
// update
exports.put = function(req, res){

    
    const { id } = req.body
    let index =0
    const foundmember = data.members.find(function(member, foundIndex){
        if(id== member.id){
            index = foundIndex
            return true
        }
       
    })

    if (!foundmember) return res.send("Instrictor not found!")

    const member = { 
        ...foundmember,
        ...req.body,
        birth: Date.parse(req.body.birth),
        id: Number(req.body.id)
    }

    data.members[index] = member

    fs.writeFile("data.json", JSON.stringify(data, null, 2), function(err){
       if(err) return res.send("Write errpr!")

       return res.redirect(`/members/${id}`)
    })
    



}
//delete
exports.delete = function(req, res){
    const { id } = req.body
    const filteredmembers = data.members.filter(function(member){
        return member.id != id
    })

    data.members = filteredmembers

    fs.writeFile("data.json", JSON.stringify(data, null, 2), function(err){
        if(err) return res.send("Write file error!")
        return res.redirect("/members")
    })
}