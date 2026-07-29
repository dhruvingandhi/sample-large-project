# Explore: explore_2823
# Auto-generated LookML Explore File

include: "/views/domain_20/view_08470.view.lkml"
include: "/views/domain_22/view_08472.view.lkml"
include: "/views/domain_23/view_08473.view.lkml"
include: "/views/domain_24/view_08474.view.lkml"

explore: explore_2823 {
  label: "Explore Explore 2823"
  description: "Comprehensive analytics explore joining base view_08470 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_08470
  
  always_filter: {
    filters: [view_08470.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08470.created_at_date: "7 days"]
    unless: [view_08470.id, view_08470.status]
  }

  join: view_08472 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08470.user_id} = ${view_08472.id} ;;
    required_joins: []
  }

  join: view_08473 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08470.account_id} = ${view_08473.account_id} ;;
    required_joins: [view_08472]
  }

  join: view_08474 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08470.category} = ${view_08474.category} ;;
  }

  access_filter: {
    field: view_08470.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08470.is_deleted} = false ;;
}
