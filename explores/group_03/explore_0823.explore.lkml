# Explore: explore_0823
# Auto-generated LookML Explore File

include: "/views/domain_20/view_02470.view.lkml"
include: "/views/domain_22/view_02472.view.lkml"
include: "/views/domain_23/view_02473.view.lkml"
include: "/views/domain_24/view_02474.view.lkml"

explore: explore_0823 {
  label: "Explore Explore 0823"
  description: "Comprehensive analytics explore joining base view_02470 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_02470
  
  always_filter: {
    filters: [view_02470.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02470.created_at_date: "7 days"]
    unless: [view_02470.id, view_02470.status]
  }

  join: view_02472 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02470.user_id} = ${view_02472.id} ;;
    required_joins: []
  }

  join: view_02473 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02470.account_id} = ${view_02473.account_id} ;;
    required_joins: [view_02472]
  }

  join: view_02474 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02470.category} = ${view_02474.category} ;;
  }

  access_filter: {
    field: view_02470.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02470.is_deleted} = false ;;
}
