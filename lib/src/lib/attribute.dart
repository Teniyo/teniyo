enum AttributeType{
  If, setKey
}

class Attribute{
  AttributeType type;
  bool condition = true;
  dynamic value;
  dynamic elseValue;

  Attribute.If(this.condition, this.value, [this.elseValue]): type = AttributeType.If;

  Attribute.setKey(this.condition): type = AttributeType.setKey;
}