# Update for 500 file diff target
# Explore: explore_3465
# Auto-generated LookML Explore File

include: "/views/domain_46/view_10396.view.lkml"
include: "/views/domain_48/view_10398.view.lkml"
include: "/views/domain_49/view_10399.view.lkml"
include: "/views/domain_50/view_10400.view.lkml"

explore: explore_3465 {
  label: "Explore Explore 3465"
  description: "Comprehensive analytics explore joining base view_10396 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_10396
  
  always_filter: {
    filters: [view_10396.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10396.created_at_date: "7 days"]
    unless: [view_10396.id, view_10396.status]
  }

  join: view_10398 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10396.user_id} = ${view_10398.id} ;;
    required_joins: []
  }

  join: view_10399 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10396.account_id} = ${view_10399.account_id} ;;
    required_joins: [view_10398]
  }

  join: view_10400 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10396.category} = ${view_10400.category} ;;
  }

  access_filter: {
    field: view_10396.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10396.is_deleted} = false ;;
}
