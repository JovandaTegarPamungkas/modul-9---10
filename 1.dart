// import "dart:io";

// class Node<T>{
//   T nodeValue;
//   Node<T>?  left, right, parent;

//   Node(this.nodeValue, [this.parent]);
  
// }

// class BinarySearchTree <T extends Comparable>{
// Node<T>? root;
// int treeSize = 0;

//   bool add(T newValue) {
//     Node<T>? node = root, parent;
//     int OrderValue = 0;

//     while(node != null){
//       parent = node;
//       OrderValue = newValue.compareTo(node.nodeValue);

//       if (OrderValue == 0) {
//         return false;
//       } else if(OrderValue < 0){
//         node = node.left;
//       }else{
//         node = node.right;
//       }
//     }
//     return true;
//   }

//   void printTreeStrucutre([Node<T>? node, String prefix = "", bool isLeft=true]){
//     node??=root;

//   if (node==null) return;

//   if (node.right !=null){
//     printTreeStrucutre(node.right, prefix + (isLeft? "| " : ""), false);
//   }

//   stdout.write(prefix);
//   stdout.write(isLeft ? "L" : "");
//   }
// }


import "dart:io"; // Required for stdout.write

// Represents a single node in the Binary Search Tree.
class Node<T> {
  T nodeValue; // The data stored in this node
  Node<T>? left; // Reference to the left child node
  Node<T>? right; // Reference to the right child node
  Node<T>? parent; // Reference to the parent node (useful for some operations, but not strictly needed for basic BST)

  // Constructor for a Node.
  // Takes a value and an optional parent node.
  Node(this.nodeValue, [this.parent]);
}

// Implements a Binary Search Tree.
// T must extend Comparable to allow comparison of node values.
class BinarySearchTree<T extends Comparable> {
  Node<T>? root; // The root node of the tree
  int treeSize = 0; // Keeps track of the number of nodes in the tree

  // Adds a new value to the binary search tree.
  // Returns true if the value was added, false if it's a duplicate.
  bool add(T newValue) {
    Node<T>? node = root; // Start traversal from the root
    Node<T>? parent; // To keep track of the parent of the current node
    int orderValue; // Stores the result of the comparison (newValue vs currentNode.nodeValue)

    // If the tree is empty, the new value becomes the root.
    if (root == null) {
      root = Node(newValue);
      treeSize++;
      return true;
    }

    // Traverse the tree to find the correct insertion point.
    while (node != null) {
      parent = node; // Update parent before moving to the next node
      orderValue = newValue.compareTo(node.nodeValue);

      if (orderValue == 0) {
        // Value already exists in the tree, so we don't add duplicates.
        return false;
      } else if (orderValue < 0) {
        // New value is smaller, go to the left subtree.
        node = node.left;
      } else {
        // New value is larger, go to the right subtree.
        node = node.right;
      }
    }

    // Create the new node with its value and determined parent.
    Node<T> newNode = Node(newValue, parent);

    // Attach the new node to its parent.
    // 'parent' will not be null here because we handled the 'root == null' case.
    orderValue = newValue.compareTo(parent!.nodeValue); // Re-compare with the parent node's value

    if (orderValue < 0) {
      // If the new value is smaller than the parent, it becomes the left child.
      parent.left = newNode;
    } else {
      // If the new value is larger than the parent, it becomes the right child.
      parent.right = newNode;
    }

    treeSize++; // Increment the tree size
    return true; // Successfully added the new value
  }

  // Finds a node with the given data in the tree.
  // Returns the Node<T> if found, otherwise returns null.
  Node<T>? findNode(T data) {
    Node<T>? node = root; // Start search from the root
    int orderValue;

    while (node != null) {
      orderValue = data.compareTo(node.nodeValue);

      if (orderValue == 0) {
        // Node found!
        print('\nNode $data ditemukan.');
        return node;
      } else if (orderValue > 0) {
        // Data is larger, go to the right subtree.
        node = node.right;
      } else {
        // Data is smaller, go to the left subtree.
        node = node.left;
      }
    }
    // If the loop finishes, the node was not found.
    print('\nNode $data tidak ditemukan.');
    return null;
  }

  // Prints the tree structure visually (rotated 90 degrees clockwise).
  // This is a recursive helper function.
  void _printTreeStructure(Node<T>? node, String prefix, bool isLeft) {
    if (node == null) {
      return;
    }

    // Recursively print the right subtree first (for a top-down visual)
    _printTreeStructure(node.right, prefix + (isLeft ? "│   " : "    "), false);

    // Print the current node
    stdout.write(prefix);
    stdout.write(isLeft ? "└── " : "┌── ");
    stdout.writeln(node.nodeValue);

    // Recursively print the left subtree
    _printTreeStructure(node.left, prefix + (isLeft ? "    " : "│   "), true);
  }

  // Public method to initiate printing the tree structure.
  void printTreeStructure() {
    if (root == null) {
      print("Tree is empty.");
      return;
    }
    print("\n--- Tree Structure ---");
    _printTreeStructure(root, "", true); // Start with root, assuming it's the "left" branch of nothing above it
    print("----------------------");
  }


  // Performs a pre-order traversal of the tree.
  // Prints the node value, then recursively visits left, then right.
  void preOrder(Node<T>? node) {
    if (node != null) {
      stdout.write('${node.nodeValue} '); // Added space for readability
      preOrder(node.left);
      preOrder(node.right);
    }
  }

  // Public method to initiate pre-order traversal from the root.
  void printPreOrderTraversal() {
    print("\n--- Pre-Order Traversal ---");
    preOrder(root);
    stdout.writeln(); // New line after traversal
    print("---------------------------");
  }
}

void main() {
  // Instantiate the BinarySearchTree with a specific type (e.g., int).
  BinarySearchTree<int> bst = BinarySearchTree<int>();

  print("Adding nodes...");
  bst.add(10);
  bst.add(5);
  bst.add(15);
  bst.add(3);
  bst.add(7);
  bst.add(12);
  bst.add(18);
  bst.add(11); // Added a node to test the left/right logic further
  bst.add(13);
  bst.add(6);
  bst.add(8);
  print("Nodes added. Tree size: ${bst.treeSize}");

  // Test findNode method
  bst.findNode(11);
  bst.findNode(20);
  bst.findNode(10);

  // Print the tree structure
  bst.printTreeStructure();

  // Print the pre-order traversal
  bst.printPreOrderTraversal();
}