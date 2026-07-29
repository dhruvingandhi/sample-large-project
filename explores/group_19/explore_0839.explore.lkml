# Explore: explore_0839
# Auto-generated LookML Explore File

include: "/views/domain_18/view_02518.view.lkml"
include: "/views/domain_20/view_02520.view.lkml"
include: "/views/domain_21/view_02521.view.lkml"
include: "/views/domain_22/view_02522.view.lkml"

explore: explore_0839 {
  label: "Explore Explore 0839"
  description: "Comprehensive analytics explore joining base view_02518 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_02518
  
  always_filter: {
    filters: [view_02518.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02518.created_at_date: "7 days"]
    unless: [view_02518.id, view_02518.status]
  }

  join: view_02520 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02518.user_id} = ${view_02520.id} ;;
    required_joins: []
  }

  join: view_02521 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02518.account_id} = ${view_02521.account_id} ;;
    required_joins: [view_02520]
  }

  join: view_02522 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02518.category} = ${view_02522.category} ;;
  }

  access_filter: {
    field: view_02518.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02518.is_deleted} = false ;;
}
