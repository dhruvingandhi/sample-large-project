# Update for 2000 file diff target
# Explore: explore_3458
# Auto-generated LookML Explore File

include: "/views/domain_25/view_10375.view.lkml"
include: "/views/domain_27/view_10377.view.lkml"
include: "/views/domain_28/view_10378.view.lkml"
include: "/views/domain_29/view_10379.view.lkml"

explore: explore_3458 {
  label: "Explore Explore 3458"
  description: "Comprehensive analytics explore joining base view_10375 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_10375
  
  always_filter: {
    filters: [view_10375.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10375.created_at_date: "7 days"]
    unless: [view_10375.id, view_10375.status]
  }

  join: view_10377 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10375.user_id} = ${view_10377.id} ;;
    required_joins: []
  }

  join: view_10378 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10375.account_id} = ${view_10378.account_id} ;;
    required_joins: [view_10377]
  }

  join: view_10379 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10375.category} = ${view_10379.category} ;;
  }

  access_filter: {
    field: view_10375.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10375.is_deleted} = false ;;
}
