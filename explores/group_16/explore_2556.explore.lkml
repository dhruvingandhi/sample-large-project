# Explore: explore_2556
# Auto-generated LookML Explore File

include: "/views/domain_19/view_07669.view.lkml"
include: "/views/domain_21/view_07671.view.lkml"
include: "/views/domain_22/view_07672.view.lkml"
include: "/views/domain_23/view_07673.view.lkml"

explore: explore_2556 {
  label: "Explore Explore 2556"
  description: "Comprehensive analytics explore joining base view_07669 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_07669
  
  always_filter: {
    filters: [view_07669.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07669.created_at_date: "7 days"]
    unless: [view_07669.id, view_07669.status]
  }

  join: view_07671 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07669.user_id} = ${view_07671.id} ;;
    required_joins: []
  }

  join: view_07672 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07669.account_id} = ${view_07672.account_id} ;;
    required_joins: [view_07671]
  }

  join: view_07673 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07669.category} = ${view_07673.category} ;;
  }

  access_filter: {
    field: view_07669.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07669.is_deleted} = false ;;
}
