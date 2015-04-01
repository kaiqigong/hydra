require "./style.less"
$ = require './bower_components/jquery/dist/jquery.js'

$(->
  $('#run').on 'click', ()->
    console.log Blockly.JavaScript.workspaceToCode()
    BlocklyStorage.backupOnUnload()
)

Blockly.Blocks['hydra_setcolor'] =
  init: ->
    this.setHelpUrl('https://blockly-demo.appspot.com/static/demos/blockfactory/index.html#sgu2sx')
    this.setColour(270)
    this.appendDummyInput()
        .appendField('Set Color')
    this.appendValueInput('R')
    .setCheck('Number')
    .appendField('Red')
    this.appendValueInput('G')
    .setCheck('Number')
    .appendField('Green')
    this.appendValueInput('B')
    .setCheck('Number')
    .appendField('Blue')
    this.setInputsInline(true)
    this.setPreviousStatement(true)
    this.setNextStatement(true)
    this.setTooltip('')

Blockly.JavaScript['hydra_setcolor'] = (block) ->
  value_r = Blockly.JavaScript.valueToCode(block, 'R', Blockly.JavaScript.ORDER_ATOMIC)
  value_g = Blockly.JavaScript.valueToCode(block, 'G', Blockly.JavaScript.ORDER_ATOMIC)
  value_b = Blockly.JavaScript.valueToCode(block, 'B', Blockly.JavaScript.ORDER_ATOMIC)
  # TODO: Assemble JavaScript into code variable.
  console.log value_r, value_g, value_b
  $('.playground').css 'background-color', "rgb(#{value_r}, #{value_g}, #{value_b})"
  code = 'hydra_setcolor'

Blockly.inject document.getElementById('blocklyDiv'), {toolbox: document.getElementById('toolbox')}

window.setTimeout(BlocklyStorage.restoreBlocks, 0)
