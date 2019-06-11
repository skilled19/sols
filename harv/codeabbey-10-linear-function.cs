'use strict'
let Promise = require('bluebird')
let fs = Promise.promisifyAll(require('fs'))

fs.readFileAsync('input.txt', 'utf8')
  .then((contents) => {
    main(contents)
  },
  (err) => {
    return err
  })

let main = (input) => {
  let lines = input.split('\n')
  let count = lines.shift()
  let output = ''
  for (let i = 0; i < count; i++) {
  let coords = lines.shift().split(' ').map((number) => {
    return number * 1
  })
    let x1 = coords.shift()
    let y1 = coords.shift()
    let x2 = coords.shift()
    let y2 = coords.shift()
    let slope = (y1 - y2) / (x1 - x2)
    console.log(y1, slope, x1)
    let yIntercept = y2 - slope * x2
    output += '(' + slope + ' ' + yIntercept + ') '
  }
  console.log(output)
}
# uedelaflieh