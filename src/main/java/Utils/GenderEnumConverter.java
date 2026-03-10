package Utils;

import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

@Converter(autoApply = true)
public class GenderEnumConverter implements AttributeConverter<GenderEnum, String> {

    @Override
    public String convertToDatabaseColumn(GenderEnum attribute) {
        if (attribute == null) {
            return null;
        }
        return attribute.name();
    }

    @Override
    public GenderEnum convertToEntityAttribute(String dbData) {
        if (dbData == null || dbData.trim().isEmpty()) {
            return null;
        }
        String val = dbData.trim();

        // Try parsing as ordinal (integer)
        try {
            int ordinal = Integer.parseInt(val);
            if (ordinal >= 0 && ordinal < GenderEnum.values().length) {
                return GenderEnum.values()[ordinal];
            }
        } catch (NumberFormatException e) {
            // Not an integer, proceed to parse as string name
        }

        // Try parsing as string name (case-insensitive)
        try {
            return GenderEnum.valueOf(val.toUpperCase());
        } catch (IllegalArgumentException e) {
            return null; // Or throw exception / return default
        }
    }
}
