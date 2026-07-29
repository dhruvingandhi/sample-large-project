# Explore: explore_1271
# Auto-generated LookML Explore File

include: "/views/domain_14/view_03814.view.lkml"
include: "/views/domain_16/view_03816.view.lkml"
include: "/views/domain_17/view_03817.view.lkml"
include: "/views/domain_18/view_03818.view.lkml"

explore: explore_1271 {
  label: "Explore Explore 1271"
  description: "Comprehensive analytics explore joining base view_03814 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_03814
  
  always_filter: {
    filters: [view_03814.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03814.created_at_date: "7 days"]
    unless: [view_03814.id, view_03814.status]
  }

  join: view_03816 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03814.user_id} = ${view_03816.id} ;;
    required_joins: []
  }

  join: view_03817 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03814.account_id} = ${view_03817.account_id} ;;
    required_joins: [view_03816]
  }

  join: view_03818 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03814.category} = ${view_03818.category} ;;
  }

  access_filter: {
    field: view_03814.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03814.is_deleted} = false ;;
}
