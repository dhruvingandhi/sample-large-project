# Explore: explore_1489
# Auto-generated LookML Explore File

include: "/views/domain_18/view_04468.view.lkml"
include: "/views/domain_20/view_04470.view.lkml"
include: "/views/domain_21/view_04471.view.lkml"
include: "/views/domain_22/view_04472.view.lkml"

explore: explore_1489 {
  label: "Explore Explore 1489"
  description: "Comprehensive analytics explore joining base view_04468 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_04468
  
  always_filter: {
    filters: [view_04468.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04468.created_at_date: "7 days"]
    unless: [view_04468.id, view_04468.status]
  }

  join: view_04470 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04468.user_id} = ${view_04470.id} ;;
    required_joins: []
  }

  join: view_04471 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04468.account_id} = ${view_04471.account_id} ;;
    required_joins: [view_04470]
  }

  join: view_04472 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04468.category} = ${view_04472.category} ;;
  }

  access_filter: {
    field: view_04468.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04468.is_deleted} = false ;;
}
