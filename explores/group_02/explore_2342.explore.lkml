# Update for 500 file diff target
# Explore: explore_2342
# Auto-generated LookML Explore File

include: "/views/domain_27/view_07027.view.lkml"
include: "/views/domain_29/view_07029.view.lkml"
include: "/views/domain_30/view_07030.view.lkml"
include: "/views/domain_31/view_07031.view.lkml"

explore: explore_2342 {
  label: "Explore Explore 2342"
  description: "Comprehensive analytics explore joining base view_07027 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_07027
  
  always_filter: {
    filters: [view_07027.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07027.created_at_date: "7 days"]
    unless: [view_07027.id, view_07027.status]
  }

  join: view_07029 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07027.user_id} = ${view_07029.id} ;;
    required_joins: []
  }

  join: view_07030 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07027.account_id} = ${view_07030.account_id} ;;
    required_joins: [view_07029]
  }

  join: view_07031 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07027.category} = ${view_07031.category} ;;
  }

  access_filter: {
    field: view_07027.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07027.is_deleted} = false ;;
}
