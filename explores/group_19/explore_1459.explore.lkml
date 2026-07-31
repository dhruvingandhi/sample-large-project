# Update for 2000 file diff target
# Explore: explore_1459
# Auto-generated LookML Explore File

include: "/views/domain_28/view_04378.view.lkml"
include: "/views/domain_30/view_04380.view.lkml"
include: "/views/domain_31/view_04381.view.lkml"
include: "/views/domain_32/view_04382.view.lkml"

explore: explore_1459 {
  label: "Explore Explore 1459"
  description: "Comprehensive analytics explore joining base view_04378 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_04378
  
  always_filter: {
    filters: [view_04378.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04378.created_at_date: "7 days"]
    unless: [view_04378.id, view_04378.status]
  }

  join: view_04380 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04378.user_id} = ${view_04380.id} ;;
    required_joins: []
  }

  join: view_04381 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04378.account_id} = ${view_04381.account_id} ;;
    required_joins: [view_04380]
  }

  join: view_04382 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04378.category} = ${view_04382.category} ;;
  }

  access_filter: {
    field: view_04378.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04378.is_deleted} = false ;;
}
