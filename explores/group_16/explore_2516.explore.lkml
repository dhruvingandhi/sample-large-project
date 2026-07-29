# Explore: explore_2516
# Auto-generated LookML Explore File

include: "/views/domain_49/view_07549.view.lkml"
include: "/views/domain_01/view_07551.view.lkml"
include: "/views/domain_02/view_07552.view.lkml"
include: "/views/domain_03/view_07553.view.lkml"

explore: explore_2516 {
  label: "Explore Explore 2516"
  description: "Comprehensive analytics explore joining base view_07549 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_07549
  
  always_filter: {
    filters: [view_07549.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07549.created_at_date: "7 days"]
    unless: [view_07549.id, view_07549.status]
  }

  join: view_07551 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07549.user_id} = ${view_07551.id} ;;
    required_joins: []
  }

  join: view_07552 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07549.account_id} = ${view_07552.account_id} ;;
    required_joins: [view_07551]
  }

  join: view_07553 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07549.category} = ${view_07553.category} ;;
  }

  access_filter: {
    field: view_07549.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07549.is_deleted} = false ;;
}
