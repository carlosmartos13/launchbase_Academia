
const { age, date } = require("../../lib/utils")
const Intl = require('intl')

const Members = require('../models/member')


module.exports = {
    index(req, res) {

        Members.all(function (members) {
            return res.render("members/index", { members })
        })

    },
    create(req, res) {
        Members.instructorsSelectOptions(function(options){
        return res.render("members/create", { instructorOptions: options })

        })
    },
    post(req, res) {
        const keys = Object.keys(req.body)

        for (key of keys) {
            if (req.body[key] == "") {
                return res.send("Please, fill all fields!")
            }
        }

        Members.create(req.body, function (member) {
        return res.redirect(`/members/${member.id}`)


        })







    },
    show(req, res) {
        Members.find(req.params.id, function (member) {
            if (!member) return res.send("member not found!")

            member.birth = date(member.birth).birthDate

            return res.render("members/show", { member })

        })
    },
    edit(req, res) {
        Members.find(req.params.id, function (member) {
            if (!member) return res.send("member not found!")

            member.birth = date(member.birth).iso

            Members.instructorsSelectOptions(function(options){
                return res.render("members/edit", { member, instructorOptions: options })
        
                })
            


        })      
    },
    put(req, res) {
        const keys = Object.keys(req.body)

        for (key of keys) {
            if (req.body[key] == "") {
                return res.send("Please, fill all fields!")
            }
        }

        Members.update(req.body, function(){
            return res.redirect(`/members/${req.body.id}`)
        })


    },
    delete(req, res) {
        Members.delete(req.body.id, function(){
            return res.redirect(`/members/`)
        })
    }
    
}
