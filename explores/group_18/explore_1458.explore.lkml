# Update for 2000 file diff target
# Explore: explore_1458
# Auto-generated LookML Explore File

include: "/views/domain_25/view_04375.view.lkml"
include: "/views/domain_27/view_04377.view.lkml"
include: "/views/domain_28/view_04378.view.lkml"
include: "/views/domain_29/view_04379.view.lkml"

explore: explore_1458 {
  label: "Explore Explore 1458"
  description: "Comprehensive analytics explore joining base view_04375 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_04375
  
  always_filter: {
    filters: [view_04375.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04375.created_at_date: "7 days"]
    unless: [view_04375.id, view_04375.status]
  }

  join: view_04377 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04375.user_id} = ${view_04377.id} ;;
    required_joins: []
  }

  join: view_04378 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04375.account_id} = ${view_04378.account_id} ;;
    required_joins: [view_04377]
  }

  join: view_04379 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04375.category} = ${view_04379.category} ;;
  }

  access_filter: {
    field: view_04375.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04375.is_deleted} = false ;;
}
