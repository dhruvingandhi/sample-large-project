# Update for 2000 file diff target
# Explore: explore_2459
# Auto-generated LookML Explore File

include: "/views/domain_28/view_07378.view.lkml"
include: "/views/domain_30/view_07380.view.lkml"
include: "/views/domain_31/view_07381.view.lkml"
include: "/views/domain_32/view_07382.view.lkml"

explore: explore_2459 {
  label: "Explore Explore 2459"
  description: "Comprehensive analytics explore joining base view_07378 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_07378
  
  always_filter: {
    filters: [view_07378.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07378.created_at_date: "7 days"]
    unless: [view_07378.id, view_07378.status]
  }

  join: view_07380 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07378.user_id} = ${view_07380.id} ;;
    required_joins: []
  }

  join: view_07381 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07378.account_id} = ${view_07381.account_id} ;;
    required_joins: [view_07380]
  }

  join: view_07382 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07378.category} = ${view_07382.category} ;;
  }

  access_filter: {
    field: view_07378.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07378.is_deleted} = false ;;
}
