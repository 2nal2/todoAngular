import { Component, OnInit } from '@angular/core';
import { TodoServiceService } from '../../services/todo-service.service';
import { Observable } from 'rxjs';
import { Todo } from '../../models/todo';

@Component({
  selector: 'app-todos',
  templateUrl: './todos.component.html',
  styleUrls: ['./todos.component.scss']
})
export class TodosComponent implements OnInit {
  todosObservable: Observable<Todo[]>;
  todos: Todo[] = [];
  constructor(private todoService: TodoServiceService) { }

  ngOnInit() {
    this.todosObservable = this.todoService.getTodos();
    this.todosObservable.subscribe(todos => {
      this.todos = todos;
    });
  }

  deleteTodo(todo){
    this.todoService.deleteTodo(todo).subscribe(deletedTodo => {
      this.todos = this.todos.filter(item => item.id != todo.id)
    });
  }

  addTodo(todo){
    this.todoService.createTodo(todo).subscribe(addedTodo=> this.todos.push(addedTodo));
  }
}
