# Explore: explore_3823
# Auto-generated LookML Explore File

include: "/views/domain_20/view_11470.view.lkml"
include: "/views/domain_22/view_11472.view.lkml"
include: "/views/domain_23/view_11473.view.lkml"
include: "/views/domain_24/view_11474.view.lkml"

explore: explore_3823 {
  label: "Explore Explore 3823"
  description: "Comprehensive analytics explore joining base view_11470 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_11470
  
  always_filter: {
    filters: [view_11470.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11470.created_at_date: "7 days"]
    unless: [view_11470.id, view_11470.status]
  }

  join: view_11472 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11470.user_id} = ${view_11472.id} ;;
    required_joins: []
  }

  join: view_11473 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11470.account_id} = ${view_11473.account_id} ;;
    required_joins: [view_11472]
  }

  join: view_11474 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11470.category} = ${view_11474.category} ;;
  }

  access_filter: {
    field: view_11470.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11470.is_deleted} = false ;;
}
