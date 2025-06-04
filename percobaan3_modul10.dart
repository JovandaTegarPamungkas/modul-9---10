class STNode<T> {
  T nodeValue;
  STNode<T>? left, right, parent;
  STNode(this.nodeValue, this.parent);
}

class BinarySearchTree<T extends Comparable> {
  STNode<T>? root;

  bool find(T item) {
    return findNode(item) != null;
  }

  STNode<T>? findNode(T item) {
    STNode<T>? t = root;
    while (t != null) {
      int cmp = item.compareTo(t.nodeValue);
      if (cmp == 0) return t;
      t = (cmp < 0) ? t.left : t.right;
    }
    return null;
  }

  bool add(T item) {
    STNode<T>? t = root, parent;
    int orderValue = 0;
    while (t != null) {
      parent = t;
      orderValue = item.compareTo(t.nodeValue);
      if (orderValue == 0) return false;
      t = (orderValue < 0) ? t.left : t.right;
    }
    STNode<T> newNode = STNode(item, parent);
    if (parent == null) root = newNode;
    else if (orderValue < 0) parent.left = newNode;
    else parent.right = newNode;
    return true;
  }
}

void main() {
  var bst = BinarySearchTree<int>();
  bst.add(35);
  bst.add(18);
  bst.add(25);

  print(bst.find(25) ? 'Node ditemukan' : 'Node tidak ditemukan');
  print(bst.find(100) ? 'Node ditemukan' : 'Node tidak ditemukan');
}
