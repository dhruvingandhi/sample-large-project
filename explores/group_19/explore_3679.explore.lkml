# Explore: explore_3679
# Auto-generated LookML Explore File

include: "/views/domain_38/view_11038.view.lkml"
include: "/views/domain_40/view_11040.view.lkml"
include: "/views/domain_41/view_11041.view.lkml"
include: "/views/domain_42/view_11042.view.lkml"

explore: explore_3679 {
  label: "Explore Explore 3679"
  description: "Comprehensive analytics explore joining base view_11038 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_11038
  
  always_filter: {
    filters: [view_11038.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11038.created_at_date: "7 days"]
    unless: [view_11038.id, view_11038.status]
  }

  join: view_11040 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11038.user_id} = ${view_11040.id} ;;
    required_joins: []
  }

  join: view_11041 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11038.account_id} = ${view_11041.account_id} ;;
    required_joins: [view_11040]
  }

  join: view_11042 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11038.category} = ${view_11042.category} ;;
  }

  access_filter: {
    field: view_11038.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11038.is_deleted} = false ;;
}
