import { Component } from '@angular/core';

@Component({
  selector: 'app-top-toolbar',
  templateUrl: './top-toolbar.component.pug',
  styleUrls: ['./top-toolbar.component.sass']
})
export class TopToolbarComponent {
  menuClickedStatus = false;

  onMenuClicked() {
    return (this.menuClickedStatus = !this.menuClickedStatus);
  }
}
