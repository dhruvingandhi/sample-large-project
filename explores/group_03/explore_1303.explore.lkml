# Explore: explore_1303
# Auto-generated LookML Explore File

include: "/views/domain_10/view_03910.view.lkml"
include: "/views/domain_12/view_03912.view.lkml"
include: "/views/domain_13/view_03913.view.lkml"
include: "/views/domain_14/view_03914.view.lkml"

explore: explore_1303 {
  label: "Explore Explore 1303"
  description: "Comprehensive analytics explore joining base view_03910 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_03910
  
  always_filter: {
    filters: [view_03910.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03910.created_at_date: "7 days"]
    unless: [view_03910.id, view_03910.status]
  }

  join: view_03912 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03910.user_id} = ${view_03912.id} ;;
    required_joins: []
  }

  join: view_03913 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03910.account_id} = ${view_03913.account_id} ;;
    required_joins: [view_03912]
  }

  join: view_03914 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03910.category} = ${view_03914.category} ;;
  }

  access_filter: {
    field: view_03910.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03910.is_deleted} = false ;;
}
