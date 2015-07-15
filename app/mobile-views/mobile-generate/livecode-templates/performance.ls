local localFields = "performance,performance_date,performance_time,call_time,location,leader_name,phone_number,notes"
local editingExisting
local cached_value_array
local resource_name = "performance"

on mouseUp
      makeFieldsNonEditable
      set the label of button "edit_performance" to "Edit"
end mouseUp

command restoreLocalFields
   restoreFieldValues  cached_value_array
end restoreLocalFields

command cacheLocalFields
   cacheFieldValues localFields, cached_value_array
end cacheLocalFields

command clearLocalFields
   clearFields localFields
end clearLocalFields

command makeLocalFieldsNotEditable
   makeFieldsNonEditable localFields
end makeLocalFieldsNotEditable

command makeLocalFieldsEditable
   makeFieldsEditable localFields
end makeLocalFieldsEditable

//restore the contents of local fields previously stored with cacheFieldValues
command restoreFieldValues  cached_values
   put the keys of cached_values into fieldList
   repeat for each item fieldName in fieldList do
      put cached_values[fieldName] into field fieldName
   end repeat
end restoreFieldValues

//store the values of local fields in a LiveScript array
command cacheFieldValues fieldList, cached_values
   repeat for each item fieldName in fieldList do
      put field fieldName into cached_values[fieldName]
   end repeat
end cacheFieldValues

//set the properties of set of fields to make them not editable
command makeFieldsNonEditable fieldList
   put null into editingProps["dropShadow"]
   put true into editingProps["lockText"]
   put false into editingProps["showFocusBorder"]
   put false into editingProps["showBorder"]
   put false into editingProps["traversalOn"]

   lock screen
   repeat for each item fieldname in fieldList do
      set the properties of field fieldname to editingProps
   end repeat
   unlock screen
end makeFieldsNonEditable

//set the properties of a set of fields to make them editable
command makeFieldsEditable fieldList
   put 5 into shadowProps["distance"]
   put 21 into shadowProps["size"]
   put shadowProps into editingProps["dropShadow"]
   put true into editingProps["traversalOn"]
   put false into editingProps["lockText"]
   put true into editingProps["showFocusBorder"]
   put true into editingProps["showBorder"]

   lock screen
   repeat for each item fieldname in fieldList do
      set the properties of field fieldname to editingProps
   end repeat
   unlock screen
end makeFieldsEditable

command new_Performance
   setEditingExisting false
   lock screen
   set the label of button "edit_performance" to "Submit"
   show button "cancel_edit"
   repeat for each item field_name in fieldList do
      put "" into field field_name
   end repeat
   makeFieldsEditable
   unlock screen
end new_Performance


command populateFields fieldArray
   put fieldArray["title"] into field "performance"
   put fieldArray["date"] into field "performance_date"
   put fieldArray["performance_time"] into temp
   put char offset("T",temp) to  -9 of temp into temp
   put "" into first char of temp
   put temp  into field "performance_time"
   put fieldArray["call_time"] into  temp
   put char offset("T",temp) to  -9 of temp into temp
   put "" into first char of temp
   put temp  into field  "call_time"
   put fieldArray["location"] into field "location"
   put fieldArray["event_leader"] into field "leader_name"
   put fieldArray["leader_phone"] into field "phone_number"
   setEditingExisting true
end populateFields

command setEditingExisting truth
   put truth into editingExisting

end setEditingExisting

command isEditingExisting
   return editingExisting
end isEditingExisting

command updateResource
   put libURLFormData("performance[title]", field "performance","performance[date]",field "performance_date",performance["performance_time"],\
   field "performance_time", "performance[call_time]",field "call_time","performance[location]",  field "location","performance[leader_phone]",field "phone_number","_method", "patch") into the_request

   put "http://localhost:3000/performances/" & g_performance_id  & ".json" into theURL
   post the_request to URL theURL
end updateResource

command postNewResource
   --need to create this out of resource_name
   put libURLFormData("performance[title]", field "performance","performance[date]",field "performance_date","performance[performance_time]",\
   field "performance_time", "performance[call_time]",field "call_time","performance[location]",  field "location","performance[leader_phone]",field "phone_number") into the_request

      put myURLFormData("performance[title]", field "performance","performance[date]",field "performance_date","performance[performance_time]",\
   field "performance_time", "performance[call_time]",field "call_time","performance[location]",  field "location","performance[leader_phone]",field "phone_number") into the_request2


   post the_request  to URL "http://localhost:3000/performances.json"
end postNewResource

function myURLFormData
   put "" into outputString
   repeat with paramNum = 1 to the paramCount step 2
      put param(paramNum) into thekey
      put (paramNum + 1) into valueIndex
      put param(valueIndex) into thevalue


      put outputString & thekey & "=" & thevalue & "&" into outputString
      end repeat
      replace "[" with "%5B" in outputString
      replace "]" with "%5D" in outputString
      replace space with "+" in outputString
      replace ":" with "%3A" in outputString
      put "" into the last char of outputString
      put "" into the last char of outputString
      put "" into the last char of outputString
      return outputString
end myURLFormData
