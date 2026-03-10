package Utils;

import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

@Converter(autoApply = true)
public class RoleEnumConverter implements AttributeConverter<RoleEnum, String> {

    @Override
    public String convertToDatabaseColumn(RoleEnum attribute) {
        if (attribute == null) {
            return null;
        }
        return attribute.name();
    }

    @Override
    public RoleEnum convertToEntityAttribute(String dbData) {
        if (dbData == null || dbData.trim().isEmpty()) {
            return null;
        }
        String val = dbData.trim();

        // Try parsing as ordinal (integer)
        try {
            int ordinal = Integer.parseInt(val);
            if (ordinal >= 0 && ordinal < RoleEnum.values().length) {
                return RoleEnum.values()[ordinal];
            }
        } catch (NumberFormatException e) {
            // Not an integer, proceed to parse as string name
        }

        // Try parsing as string name (case-insensitive)
        try {
            return RoleEnum.valueOf(val.toUpperCase());
        } catch (IllegalArgumentException e) {
            return null;
        }
    }
}
