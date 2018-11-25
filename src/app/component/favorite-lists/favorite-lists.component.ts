import { FAVORITES } from './favorite-lists.mock';
import { Component, OnInit } from '@angular/core';
import { CdkDragDrop, moveItemInArray } from '@angular/cdk/drag-drop';

@Component({
  selector: 'app-favorite-lists',
  templateUrl: './favorite-lists.component.pug',
  styleUrls: ['./favorite-lists.component.sass']
})
export class FavoriteListsComponent implements OnInit {
  favorites = FAVORITES;

  constructor() {}

  ngOnInit() {}

  drop(event: CdkDragDrop<string[]>) {
    moveItemInArray(this.favorites, event.previousIndex, event.currentIndex);
  }
}
