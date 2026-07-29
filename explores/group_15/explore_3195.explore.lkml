# Explore: explore_3195
# Auto-generated LookML Explore File

include: "/views/domain_36/view_09586.view.lkml"
include: "/views/domain_38/view_09588.view.lkml"
include: "/views/domain_39/view_09589.view.lkml"
include: "/views/domain_40/view_09590.view.lkml"

explore: explore_3195 {
  label: "Explore Explore 3195"
  description: "Comprehensive analytics explore joining base view_09586 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_09586
  
  always_filter: {
    filters: [view_09586.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09586.created_at_date: "7 days"]
    unless: [view_09586.id, view_09586.status]
  }

  join: view_09588 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09586.user_id} = ${view_09588.id} ;;
    required_joins: []
  }

  join: view_09589 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09586.account_id} = ${view_09589.account_id} ;;
    required_joins: [view_09588]
  }

  join: view_09590 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09586.category} = ${view_09590.category} ;;
  }

  access_filter: {
    field: view_09586.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09586.is_deleted} = false ;;
}
