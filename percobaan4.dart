class STNode<T> {
  T nodeValue;
  STNode<T>? left, right, parent;
  STNode(this.nodeValue, this.parent);
}

class BinarySearchTree<T extends Comparable> {
  STNode<T>? root;

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

  STNode<T>? findNode(T item) {
    STNode<T>? t = root;
    while (t != null) {
      int cmp = item.compareTo(t.nodeValue);
      if (cmp == 0) return t;
      t = (cmp < 0) ? t.left : t.right;
    }
    return null;
  }

  void inOrderDisplay(STNode<T>? node) {
    if (node != null) {
      inOrderDisplay(node.left);
      print(node.nodeValue);
      inOrderDisplay(node.right);
    }
  }

  void removeNode(STNode<T>? dNode) {
    if (dNode == null) return;

    STNode<T>? pNode = dNode.parent;
    STNode<T>? rNode;

    if (dNode.left == null || dNode.right == null) {
      rNode = dNode.left ?? dNode.right;
      if (rNode != null) rNode.parent = pNode;
      if (pNode == null) root = rNode;
      else if ((dNode.nodeValue).compareTo(pNode.nodeValue) < 0) {
        pNode.left = rNode;
      } else {
        pNode.right = rNode;
      }
    } else {
      STNode<T> pOfRNode = dNode;
      rNode = dNode.right;
      while (rNode!.left != null) {
        pOfRNode = rNode;
        rNode = rNode.left;
      }
      dNode.nodeValue = rNode.nodeValue;
      if (pOfRNode == dNode) {
        dNode.right = rNode.right;
      } else {
        pOfRNode.left = rNode.right;
      }
      if (rNode.right != null) {
        rNode.right!.parent = pOfRNode;
      }
    }
  }
}

void main() {
  var bst = BinarySearchTree<int>();
  bst.add(35);
  bst.add(18);
  bst.add(25);
  bst.add(48);
  bst.add(20);

  print('InOrder Sebelum Hapus:');
  bst.inOrderDisplay(bst.root);

  var nodeToRemove = bst.findNode(20);
  bst.removeNode(nodeToRemove);

  print('\nInOrder Setelah Hapus 20:');
  bst.inOrderDisplay(bst.root);
}
