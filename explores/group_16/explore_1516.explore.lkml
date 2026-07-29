# Explore: explore_1516
# Auto-generated LookML Explore File

include: "/views/domain_49/view_04549.view.lkml"
include: "/views/domain_01/view_04551.view.lkml"
include: "/views/domain_02/view_04552.view.lkml"
include: "/views/domain_03/view_04553.view.lkml"

explore: explore_1516 {
  label: "Explore Explore 1516"
  description: "Comprehensive analytics explore joining base view_04549 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_04549
  
  always_filter: {
    filters: [view_04549.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04549.created_at_date: "7 days"]
    unless: [view_04549.id, view_04549.status]
  }

  join: view_04551 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04549.user_id} = ${view_04551.id} ;;
    required_joins: []
  }

  join: view_04552 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04549.account_id} = ${view_04552.account_id} ;;
    required_joins: [view_04551]
  }

  join: view_04553 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04549.category} = ${view_04553.category} ;;
  }

  access_filter: {
    field: view_04549.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04549.is_deleted} = false ;;
}
