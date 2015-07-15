global  g_performance_id
global performance_ar


on mouseUp
   local performance
   if the label of button "edit_performance" is Edit then
      setEditingExisting true
      makeFieldsEditable
      set the label of button "edit_performance" to "Submit"
      show button "cancel_edit"
   else                --then it's a submit
      send isEditingExisting to card "Performance"
      if the result is true then
         put libURLFormData("performance[title]", field "performance","performance[date]",field "performance_date",performance["performance_time"],\
         field "performance_time", "performance[call_time]",field "call_time","performance[location]",  field "location","performance[leader_phone]",field "phone_number","_method", "patch") into therequest


         put "&" after therequest
         put "_method=" & "patch" after therequest
         --         put libURLForData(therequest) into therequest

         put "http://localhost:3000/performances/" & g_performance_id  & ".json" into theURL
         post therequest to URL theURL
      else
         put libURLFormData("performance[title]", field "performance","performance[event_leader]",field "leader_name","performance[date]",field "performance_date",performance["performance_time"],\
         field "performance_time", "performance[call_time]",field "call_time","performance[location]",  field "location","performance[leader_phone]",field "phone_number") into therequest

         --         put URLEncode(request) into request

         post therequest  to URL "http://localhost:3000/performances.json"
         --need to parse the return
      end if
      if it contains "error" then
         set the foregroundColor of field "message" to red
         put it into field "message"
      else
         go card "Performances"
         set the foregroundColor of field "message" to white
         put "Performace saved." into field message
         hide button "cancel_edit"
         makeFieldsNonEditable
         set the label of button "edit_performance" to "Edit"
      end if
   end if
end mouseUp
