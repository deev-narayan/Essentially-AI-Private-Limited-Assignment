import 'package:flutter/material.dart';
// Assuming 'order_table.dart' exists and contains the OrdersTable widget.
import 'package:recreate/order_table_mob.dart';

class OrdersMob extends StatefulWidget {
  const OrdersMob({super.key});

  @override
  State<OrdersMob> createState() => _OrdersMobState();
}

class _OrdersMobState extends State<OrdersMob> {
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
            _buildTopControls(),
            const SizedBox(height: 16),
            const OrdersTableMob(),
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
        Expanded(
          child: Wrap(
            spacing: 6.0,
            runSpacing: 4.0,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              _buildTagInputField(),
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
      width: 100,
      height: 30,
      child: TextField(
        controller: _tagController,
        style: const TextStyle(fontSize: 10), // Text inside the field
        decoration: InputDecoration(
          hintText: 'Add Client',
          hintStyle: const TextStyle(fontSize: 10),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          border: const OutlineInputBorder(),
          suffixIcon: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(41, 255, 255, 255),
            ),
            child: IconButton(
              icon: const Icon(Icons.person_add_alt, size: 18),
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
      label: Text(
        tagName,
        style: const TextStyle(fontSize: 10), // Chip text
      ),
      onDeleted: () => _removeTag(tagName),
      deleteIcon: const Icon(Icons.close, size: 16),
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      labelStyle: TextStyle(
        fontSize: 10,
        color: Theme.of(context).colorScheme.onSecondaryContainer,
      ),
    );
  }

  /// Builds the search bar.
  Widget _buildSearchBar() {
    return Container(
      height: 30,
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(71, 255, 255, 255),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
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
          const Icon(Icons.search, color: Colors.grey, size: 18),
          const SizedBox(width: 8),
          const Expanded(
            child: TextField(
              style: TextStyle(fontSize: 10), // Search input text
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search for a stock',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the "Cancel All" button.
  Widget _buildCancelAllButton() {
    return OutlinedButton.icon(
      onPressed: () {
        // Add functionality here, e.g., clear all orders.
      },
      icon: const Icon(Icons.not_interested, size: 16),
      label: const Text(
        "Cancel All",
        style: TextStyle(fontSize: 10), // Button text
      ),
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
