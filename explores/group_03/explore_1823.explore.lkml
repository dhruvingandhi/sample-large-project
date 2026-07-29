# Explore: explore_1823
# Auto-generated LookML Explore File

include: "/views/domain_20/view_05470.view.lkml"
include: "/views/domain_22/view_05472.view.lkml"
include: "/views/domain_23/view_05473.view.lkml"
include: "/views/domain_24/view_05474.view.lkml"

explore: explore_1823 {
  label: "Explore Explore 1823"
  description: "Comprehensive analytics explore joining base view_05470 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_05470
  
  always_filter: {
    filters: [view_05470.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05470.created_at_date: "7 days"]
    unless: [view_05470.id, view_05470.status]
  }

  join: view_05472 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05470.user_id} = ${view_05472.id} ;;
    required_joins: []
  }

  join: view_05473 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05470.account_id} = ${view_05473.account_id} ;;
    required_joins: [view_05472]
  }

  join: view_05474 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05470.category} = ${view_05474.category} ;;
  }

  access_filter: {
    field: view_05470.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05470.is_deleted} = false ;;
}
