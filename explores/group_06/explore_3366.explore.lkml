# Explore: explore_3366
# Auto-generated LookML Explore File

include: "/views/domain_49/view_10099.view.lkml"
include: "/views/domain_01/view_10101.view.lkml"
include: "/views/domain_02/view_10102.view.lkml"
include: "/views/domain_03/view_10103.view.lkml"

explore: explore_3366 {
  label: "Explore Explore 3366"
  description: "Comprehensive analytics explore joining base view_10099 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_10099
  
  always_filter: {
    filters: [view_10099.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10099.created_at_date: "7 days"]
    unless: [view_10099.id, view_10099.status]
  }

  join: view_10101 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10099.user_id} = ${view_10101.id} ;;
    required_joins: []
  }

  join: view_10102 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10099.account_id} = ${view_10102.account_id} ;;
    required_joins: [view_10101]
  }

  join: view_10103 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10099.category} = ${view_10103.category} ;;
  }

  access_filter: {
    field: view_10099.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10099.is_deleted} = false ;;
}
