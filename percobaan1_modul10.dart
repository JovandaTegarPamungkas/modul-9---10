class STNode<T> {
  T nodeValue;
  STNode<T>? left, right, parent;

  STNode(this.nodeValue, this.parent);
}

class BinarySearchTree<T extends Comparable> {
  STNode<T>? root;
  int treeSize = 0;

  bool add(T item) {
    STNode<T>? t = root;
    STNode<T>? parent;
    int orderValue = 0;

    while (t != null) {
      parent = t;
      orderValue = item.compareTo(t.nodeValue);
      if (orderValue == 0) return false;
      t = (orderValue < 0) ? t.left : t.right;
    }

    STNode<T> newNode = STNode(item, parent);
    if (parent == null) {
      root = newNode;
    } else if (orderValue < 0) {
      parent.left = newNode;
    } else {
      parent.right = newNode;
    }
    treeSize++;
    return true;
  }
}

void main() {
  var bst = BinarySearchTree<int>();
  bst.add(35);
  bst.add(18);
  bst.add(25);
  bst.add(48);
  bst.add(20);
  print('Tree Size: ${bst.treeSize}');
}
