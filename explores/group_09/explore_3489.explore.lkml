# Explore: explore_3489
# Auto-generated LookML Explore File

include: "/views/domain_18/view_10468.view.lkml"
include: "/views/domain_20/view_10470.view.lkml"
include: "/views/domain_21/view_10471.view.lkml"
include: "/views/domain_22/view_10472.view.lkml"

explore: explore_3489 {
  label: "Explore Explore 3489"
  description: "Comprehensive analytics explore joining base view_10468 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_10468
  
  always_filter: {
    filters: [view_10468.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10468.created_at_date: "7 days"]
    unless: [view_10468.id, view_10468.status]
  }

  join: view_10470 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10468.user_id} = ${view_10470.id} ;;
    required_joins: []
  }

  join: view_10471 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10468.account_id} = ${view_10471.account_id} ;;
    required_joins: [view_10470]
  }

  join: view_10472 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10468.category} = ${view_10472.category} ;;
  }

  access_filter: {
    field: view_10468.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10468.is_deleted} = false ;;
}
