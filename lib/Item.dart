class Item {
  int itemPrice;
  int itemCount = 0;
  String itemDescription, itemName;
  Item(this.itemPrice, this.itemDescription, this.itemName, this.itemCount);

  incrementIt() {
    this.itemCount += 1;
  }

  decrementIt() {
    if (this.itemCount == 0) {
      this.itemCount = 0;
    } else {
      this.itemCount -= 1;
    }
  }
}
