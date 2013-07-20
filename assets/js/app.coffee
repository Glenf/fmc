'use strict'

d = document

$ ->
    defaults =
        '95e10' :
            ethanol : 10
            octane : 95
        '98e5' :
            ethanol : 5
            octane : 98
        're85' : 
            ethanol : 85
            octane : 106
        fuel1 : d.getElementById 'fuel1'
        fuel1Amount :d.getElementById 'fuel1_amount'
        fuel2 :  d.getElementById 'fuel2'
        fuel2Amount : d.getElementById 'fuel2_amount'
        results :
            total : d.getElementById 'total'
            ethanol : d.getElementById 'ethanol'
            octane : d.getElementById 'octane'

    $form = $('.calc')
    inputs = $form.find ' input'
    selects = $form.find 'select'

    $form.submit (e) ->
        e.preventDefault
        return false

    inputs.on 'change', ->
        updateValues()

    selects.on 'change', ->
        updateValues()

    updateValues = ->
        updateTotal()
        updateEthanol()
        updateOctane()


    updateTotal = ->
        el = $ defaults.results.total
        v1 = Math.floor(defaults.fuel1Amount.value)
        v2 = Math.floor(defaults.fuel2Amount.value)
        el.html v1 + v2 + ' L'

    updateEthanol = ->
        el = $ defaults.results.ethanol
        v1 = Math.floor(defaults.fuel1Amount.value)
        v2 = Math.floor(defaults.fuel2Amount.value)
        vT = v1 + v2
        g1 = defaults.fuel1.value.toLowerCase()
        g2 = defaults.fuel2.value.toLowerCase()
        e1 = defaults[g1].ethanol /100
        e2 = defaults[g2].ethanol /100

        eT = (v1 * e1 + v2 * e2)/vT*100
        el.html eT.toFixed(2) + ' %'

    updateOctane = ->
        el = $ defaults.results.octane
        v1 = Math.floor(defaults.fuel1Amount.value)
        v2 = Math.floor(defaults.fuel2Amount.value)
        vT = v1 + v2
        g1 = defaults.fuel1.value.toLowerCase()
        g2 = defaults.fuel2.value.toLowerCase()
        o1 = defaults[g1].octane
        o2 = defaults[g2].octane

        oT = Math.floor(vT/(v1/o1 + v2/o2))
        el.html oT

    updateValues()





