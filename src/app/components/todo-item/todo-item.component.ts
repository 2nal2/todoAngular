import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { Todo } from '../../models/todo';
import { TodoServiceService } from '../../services/todo-service.service';

@Component({
  selector: 'app-todo-item',
  templateUrl: './todo-item.component.html',
  styleUrls: ['./todo-item.component.scss']
})
export class TodoItemComponent implements OnInit {
  @Input() todo: Todo;
  @Output() deleteTodo:EventEmitter<any> = new EventEmitter();
  constructor(private todoService: TodoServiceService) { }

  ngOnInit() {
  }

  onToggle(todo){
    todo.completed = !todo.completed;
    this.todoService.updateTodo(todo).subscribe( updatedTodo => console.log(updatedTodo))
  }

  onDelete(todo){
    this.deleteTodo.emit(todo);
  }
}
