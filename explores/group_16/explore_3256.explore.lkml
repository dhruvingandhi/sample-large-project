# Explore: explore_3256
# Auto-generated LookML Explore File

include: "/views/domain_19/view_09769.view.lkml"
include: "/views/domain_21/view_09771.view.lkml"
include: "/views/domain_22/view_09772.view.lkml"
include: "/views/domain_23/view_09773.view.lkml"

explore: explore_3256 {
  label: "Explore Explore 3256"
  description: "Comprehensive analytics explore joining base view_09769 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_09769
  
  always_filter: {
    filters: [view_09769.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09769.created_at_date: "7 days"]
    unless: [view_09769.id, view_09769.status]
  }

  join: view_09771 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09769.user_id} = ${view_09771.id} ;;
    required_joins: []
  }

  join: view_09772 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09769.account_id} = ${view_09772.account_id} ;;
    required_joins: [view_09771]
  }

  join: view_09773 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09769.category} = ${view_09773.category} ;;
  }

  access_filter: {
    field: view_09769.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09769.is_deleted} = false ;;
}
