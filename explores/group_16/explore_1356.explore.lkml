# Explore: explore_1356
# Auto-generated LookML Explore File

include: "/views/domain_19/view_04069.view.lkml"
include: "/views/domain_21/view_04071.view.lkml"
include: "/views/domain_22/view_04072.view.lkml"
include: "/views/domain_23/view_04073.view.lkml"

explore: explore_1356 {
  label: "Explore Explore 1356"
  description: "Comprehensive analytics explore joining base view_04069 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_04069
  
  always_filter: {
    filters: [view_04069.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04069.created_at_date: "7 days"]
    unless: [view_04069.id, view_04069.status]
  }

  join: view_04071 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04069.user_id} = ${view_04071.id} ;;
    required_joins: []
  }

  join: view_04072 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04069.account_id} = ${view_04072.account_id} ;;
    required_joins: [view_04071]
  }

  join: view_04073 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04069.category} = ${view_04073.category} ;;
  }

  access_filter: {
    field: view_04069.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04069.is_deleted} = false ;;
}
