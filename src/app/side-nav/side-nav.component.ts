import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-side-nav',
  templateUrl: './side-nav.component.pug',
  styleUrls: ['./side-nav.component.sass']
})
export class SideNavComponent implements OnInit {
  constructor() {}

  ngOnInit(private vm = this) {
    vm.title = 'app';
  }
}
