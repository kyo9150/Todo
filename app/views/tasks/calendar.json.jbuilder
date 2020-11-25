json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :detail 
  json.start task.created_at   
  json.end task.deadline  
  json.url task_url(task, format: :html) 
end