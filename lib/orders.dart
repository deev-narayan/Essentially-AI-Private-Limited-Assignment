import 'package:flutter/material.dart';
// Assuming 'order_table.dart' exists and contains the OrdersTable widget.
import 'package:recreate/order_table.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  // Use a TextEditingController to manage the TextField's state.
  final _tagController = TextEditingController();

  // The list of tags is now mutable to allow adding/removing.
  final List<String> tags = ["RELIANCE", "ASIANPAINT"];

  // --- State Management Methods ---
  void _addTag() {
    // Add a new tag only if the input is not empty.
    if (_tagController.text.isNotEmpty) {
      setState(() {
        tags.add(_tagController.text.toUpperCase());
        _tagController.clear(); // Clear the text field after adding.
      });
    }
  }

  void _removeTag(String tagToRemove) {
    setState(() {
      tags.remove(tagToRemove);
    });
  }

  @override
  void dispose() {
    // Always dispose of controllers to free up resources.
    _tagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(25),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Extracted the top controls into a separate, more readable method.
            _buildTopControls(),
            const SizedBox(height: 16), // Added space for better separation.
            const OrdersTable(),
          ],
        ),
      ),
    );
  }

  // --- Builder Methods for a Cleaner Build ---

  /// Builds the top row containing all the action buttons and search fields.
  Widget _buildTopControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Use a Wrap widget for the left-side controls for better responsiveness.
        // It will wrap to the next line on smaller screens instead of overflowing.
        Expanded(
          child: Wrap(
            spacing: 12.0, // Horizontal space between items
            runSpacing: 8.0, // Vertical space if items wrap
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              _buildTagInputField(),
              // Dynamically create a chip for each tag in the list.
              ...tags.map((tag) => _buildTagChip(tag)),
              _buildSearchBar(),
            ],
          ),
        ),
        const SizedBox(width: 16),
        _buildCancelAllButton(),
      ],
    );
  }

  /// Builds the input field for adding new tags.
  Widget _buildTagInputField() {
    return SizedBox(
      width: 150, // Increased width for better usability
      height: 45,
      child: TextField(
        controller: _tagController,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: 'Add Client',
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          border: const OutlineInputBorder(),
          // This is the modern way to add an icon button inside a TextField.
          suffixIcon: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(41, 255, 255, 255),
            ),
            child: IconButton(
              icon: const Icon(Icons.person_add_alt),
              onPressed: _addTag,
            ),
          ),
        ),
      ),
    );
  }

  /// Builds a single, dismissible tag chip.
  Widget _buildTagChip(String tagName) {
    return Chip(
      label: Text(tagName),
      onDeleted: () => _removeTag(tagName),
      deleteIcon: const Icon(Icons.close, size: 18),
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      labelStyle: TextStyle(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
      ),
    );
  }

  /// Builds the search bar.
  Widget _buildSearchBar() {
    return Container(
      height: 45,
      width: 400,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(71, 255, 255, 255),
        borderRadius: BorderRadius.circular(8), // Rounded edges
        border: Border.all(
          color: Colors.grey.withOpacity(0.3), // Subtle border
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey, size: 22),
          const SizedBox(width: 8),
          const Expanded(
            child: TextField(
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search for a stock, future, option or index',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCancelAllButton() {
    return OutlinedButton.icon(
      onPressed: () {
        // Add functionality here, e.g., clear all orders.
      },
      icon: const Icon(Icons.not_interested),
      label: const Text("Cancel All"),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        foregroundColor: Theme.of(context).colorScheme.error,
        side: BorderSide(
          color: Theme.of(context).colorScheme.error.withOpacity(0.5),
        ),
      ),
    );
  }
}
