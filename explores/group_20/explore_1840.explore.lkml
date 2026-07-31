# Update for 2000 file diff target
# Explore: explore_1840
# Auto-generated LookML Explore File

include: "/views/domain_21/view_05521.view.lkml"
include: "/views/domain_23/view_05523.view.lkml"
include: "/views/domain_24/view_05524.view.lkml"
include: "/views/domain_25/view_05525.view.lkml"

explore: explore_1840 {
  label: "Explore Explore 1840"
  description: "Comprehensive analytics explore joining base view_05521 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_05521
  
  always_filter: {
    filters: [view_05521.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05521.created_at_date: "7 days"]
    unless: [view_05521.id, view_05521.status]
  }

  join: view_05523 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05521.user_id} = ${view_05523.id} ;;
    required_joins: []
  }

  join: view_05524 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05521.account_id} = ${view_05524.account_id} ;;
    required_joins: [view_05523]
  }

  join: view_05525 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05521.category} = ${view_05525.category} ;;
  }

  access_filter: {
    field: view_05521.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05521.is_deleted} = false ;;
}
