# Update for 2000 file diff target
# Explore: explore_0824
# Auto-generated LookML Explore File

include: "/views/domain_23/view_02473.view.lkml"
include: "/views/domain_25/view_02475.view.lkml"
include: "/views/domain_26/view_02476.view.lkml"
include: "/views/domain_27/view_02477.view.lkml"

explore: explore_0824 {
  label: "Explore Explore 0824"
  description: "Comprehensive analytics explore joining base view_02473 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_02473
  
  always_filter: {
    filters: [view_02473.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02473.created_at_date: "7 days"]
    unless: [view_02473.id, view_02473.status]
  }

  join: view_02475 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02473.user_id} = ${view_02475.id} ;;
    required_joins: []
  }

  join: view_02476 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02473.account_id} = ${view_02476.account_id} ;;
    required_joins: [view_02475]
  }

  join: view_02477 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02473.category} = ${view_02477.category} ;;
  }

  access_filter: {
    field: view_02473.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02473.is_deleted} = false ;;
}
