# Explore: explore_0176
# Auto-generated LookML Explore File

include: "/views/domain_29/view_00529.view.lkml"
include: "/views/domain_31/view_00531.view.lkml"
include: "/views/domain_32/view_00532.view.lkml"
include: "/views/domain_33/view_00533.view.lkml"

explore: explore_0176 {
  label: "Explore Explore 0176"
  description: "Comprehensive analytics explore joining base view_00529 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_00529
  
  always_filter: {
    filters: [view_00529.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00529.created_at_date: "7 days"]
    unless: [view_00529.id, view_00529.status]
  }

  join: view_00531 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00529.user_id} = ${view_00531.id} ;;
    required_joins: []
  }

  join: view_00532 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00529.account_id} = ${view_00532.account_id} ;;
    required_joins: [view_00531]
  }

  join: view_00533 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00529.category} = ${view_00533.category} ;;
  }

  access_filter: {
    field: view_00529.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00529.is_deleted} = false ;;
}
