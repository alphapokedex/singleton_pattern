import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:singleton_pattern/ui/components/components.dart';
import 'package:singleton_pattern/utilities/core.dart';

class EaserLabelledTextField extends StatefulWidget {
  const EaserLabelledTextField({
    Key? key,
    this.label,
    this.secondaryLabel,
    this.suffix,
    this.prefix,
    this.hintText,
    this.controller,
    this.isDense = true,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.textInputType = TextInputType.none,
    this.textInputAction,
    this.inputFormatters,
    this.onTap,
    this.readOnly = false,
    this.obscure = false,
    this.isFilled = true,
    this.outline = false,
    this.capitalize = TextCapitalization.none,
    this.trailing,
    this.maxLines,
    this.padding,
    this.isFinalField = false,
  }) : super(key: key);

  final Function(String)? onChanged, onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextCapitalization capitalize;
  final TextEditingController? controller;
  final String? label, secondaryLabel, hintText;
  final List<TextInputFormatter>? inputFormatters;
  final bool isDense, readOnly, obscure, isFinalField, isFilled, outline;
  final int? maxLines;
  final VoidCallback? onTap;
  final Widget? trailing, suffix, prefix;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? padding;

  @override
  State<EaserLabelledTextField> createState() => _EaserLabelledTextFieldState();
}

class _EaserLabelledTextFieldState extends State<EaserLabelledTextField>
    with Core, Components {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final InputBorder noBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    );
    final InputBorder outlinedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: hintGrey),
    );
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null && widget.secondaryLabel == null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.label!,
                  style: roboto600.copyWith(fontSize: 16, color: neutralBlack),
                ),
                if (widget.trailing != null) widget.trailing!,
              ],
            ),
            heightBox8,
          ],
          if (widget.secondaryLabel != null) ...[
            Row(
              children: [
                Text(
                  widget.label!,
                  style: roboto600.copyWith(fontSize: 16, color: neutralBlack),
                ),
                widthBox4,
                Text(
                  widget.secondaryLabel!,
                  style: roboto600.copyWith(fontSize: 13, color: textGrey),
                ),
              ],
            ),
            heightBox8,
          ],
          TextFormField(
            onTap: widget.onTap,
            controller: widget.controller ?? _controller,
            maxLines: widget.maxLines ?? 1,
            keyboardType: widget.textInputType,
            inputFormatters: widget.inputFormatters,
            readOnly: widget.readOnly,
            textCapitalization: widget.capitalize,
            onFieldSubmitted: widget.onFieldSubmitted,
            obscuringCharacter: '*',
            obscureText: widget.obscure,
            onChanged: widget.onChanged,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validator,
            textInputAction: widget.textInputAction ??
                (widget.isFinalField
                    ? TextInputAction.done
                    : TextInputAction.next),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              isDense: true,
              isCollapsed: widget.isDense,
              filled: widget.isFilled,
              fillColor: lightGrey,
              contentPadding: widget.isDense ? v10h15 : null,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              border: widget.outline ? outlinedBorder : noBorder,
              enabledBorder: widget.outline ? outlinedBorder : noBorder,
              disabledBorder: widget.outline ? outlinedBorder : noBorder,
              prefixIcon: widget.prefix,
              suffixIcon: widget.suffix,
              hintText: widget.hintText,
              hintStyle: widget.outline
                  ? roboto400.copyWith(
                      fontSize: 13,
                      color: hintGrey,
                    )
                  : roboto600.copyWith(
                      fontSize: 13,
                      color: grey,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
