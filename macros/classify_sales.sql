{#

{% macro classify_sales(sales_column, low_threshold, high_threshold) %}

    CASE
        WHEN {{ sales_column }} < {{ low_threshold }} THEN 'Low'
        WHEN {{ sales_column }} < {{ high_threshold }} THEN 'Medium'
        ELSE 'High'
    END

{% endmacro %}
#}


{% macro classify_sales(
    sales_column,
    low_threshold,
    high_threshold,
    include_medium=true
) %}

    CASE
        WHEN {{ sales_column }} < {{ low_threshold }} THEN 'Low'

        {% if include_medium %}
            WHEN {{ sales_column }} < {{ high_threshold }} THEN 'Medium'
        {% endif %}

        ELSE 'High'
    END

{% endmacro %}