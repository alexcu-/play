Type = require './type'

###
This is the parser class for play
###
class Parser
  # - Single line comments in play are hashes
  # - Multiple line comments are three hashes
  WHITESPACE  = /\s|\t|\r|#([^\n])*\n|\#{3}([^\#{3}])*\#{3}/
  # A variable must be in camelCase
  VARIABLE    = /[a-z][A-z0-9]+/
  # A number is the IEEE standard for numbers
  NUMBER      = /([0-9])+(\.([0-9])*)?(e(\+|\-)?(0-9)+)?/
  # A constants is uppercase, beginning with a letter and may contain underscores
  CONSTANT    = /[A-z][A-z\_0-9]+/
  # A string is wrapped in double quotes
  STRING      = /"[^"]*"/
  # A type begins with an uppercase character
  TYPE        = /[A-Z][A-z0-9]+/

  # Keywords
  KEYWORDS    = [
    # DEFINITION KEYWORDS
    'procedure' # Defines a new procedure block
    'function'  # Defines a new function block
    'type'      # Defines a new type block

    # DEFINITION HELPER KEYWORDS
    'returns'   # Return type of function or return value of function
    'with'      # Begins parameter list of function/procedure

    # CALL KEYWORDS
    'call'      # Call a function or procedure
    'pass'      # Pass a parameter list of functions or procedures

    # ASSIGNABLE KEYWORDS
    'is'        # Assignment keyword
    'empty'     # Alias to null
    'addressof' # Gets the address of a variable

    # CONDITIONAL KEYWORDS
    'if'        # If keyword
    'else'      # Else keyword
    'repeat'    # Repeat keyword

    # TRUTHY VALUES
    'true'      # true
    'false'     # false
    'yes'       # true
    'no'        # false

    # LOGIC OPERATORS
    'is'        # ==
    'isnt'      # !=
    'not'       # !

    # BOOLEAN OPERATORS
    'or'        # ||
    'and'       # &&

    # SPECIAL TYPE KEYWORDS
    'to'        # Used in Pointer to (Type)
    'of'        # Used in Array   of (Type)
    'with'      # Used in Records and Enumerations to begin member lists
    'follow'    # Follows a pointer to begin a pointer block

    # END BLOCK KEYWORD
    'end'       # Ends a block
  ]
  TYPES = [
    # STANDARD TYPES
    'Integer'     # Integer type
    'Decimal'     # Decimal type
    'String'      # String type
    'Boolean'     # Boolean type

    # SPECIAL TYPES
    'Array'       # Array type
    'Pointer'     # Pointer type
    'Enumeration' # Enumeration type
    'Record'      # Record type
  ]


  ###
  variableDeclarationStatement ::= < TYPE > < VARIABLE >
  ###
  variableDeclarationStatement = (in) ->
  ###
  assignmentStatement ::= variis
                          < STRING | NUMBER | VARIABLE >
  ###
  assignmentStatement = (in) ->
    return
  ###
  newTypeStatement ::= newType < TYPE > is ("Record"|"Enumeration")
  ###
  assignmentStatement = (in) ->