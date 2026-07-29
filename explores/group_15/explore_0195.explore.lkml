# Explore: explore_0195
# Auto-generated LookML Explore File

include: "/views/domain_36/view_00586.view.lkml"
include: "/views/domain_38/view_00588.view.lkml"
include: "/views/domain_39/view_00589.view.lkml"
include: "/views/domain_40/view_00590.view.lkml"

explore: explore_0195 {
  label: "Explore Explore 0195"
  description: "Comprehensive analytics explore joining base view_00586 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_00586
  
  always_filter: {
    filters: [view_00586.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00586.created_at_date: "7 days"]
    unless: [view_00586.id, view_00586.status]
  }

  join: view_00588 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00586.user_id} = ${view_00588.id} ;;
    required_joins: []
  }

  join: view_00589 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00586.account_id} = ${view_00589.account_id} ;;
    required_joins: [view_00588]
  }

  join: view_00590 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00586.category} = ${view_00590.category} ;;
  }

  access_filter: {
    field: view_00586.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00586.is_deleted} = false ;;
}
