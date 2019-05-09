import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { Todo } from 'src/app/models/todo';

@Component({
  selector: 'app-form',
  templateUrl: './form.component.html',
  styleUrls: ['./form.component.scss']
})
export class FormComponent implements OnInit {
  @Output() addTodo: EventEmitter<any> = new EventEmitter();

  todo:Todo = new Todo();
  constructor() { }

  ngOnInit() {
    
  }

  onSubmit(){
    this.todo.completed = false;
    this.addTodo.emit(this.todo);
    this.todo = new Todo();
  }

}
