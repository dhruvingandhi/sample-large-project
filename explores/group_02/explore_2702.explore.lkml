# Update for 500 file diff target
# Explore: explore_2702
# Auto-generated LookML Explore File

include: "/views/domain_07/view_08107.view.lkml"
include: "/views/domain_09/view_08109.view.lkml"
include: "/views/domain_10/view_08110.view.lkml"
include: "/views/domain_11/view_08111.view.lkml"

explore: explore_2702 {
  label: "Explore Explore 2702"
  description: "Comprehensive analytics explore joining base view_08107 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_08107
  
  always_filter: {
    filters: [view_08107.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08107.created_at_date: "7 days"]
    unless: [view_08107.id, view_08107.status]
  }

  join: view_08109 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08107.user_id} = ${view_08109.id} ;;
    required_joins: []
  }

  join: view_08110 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08107.account_id} = ${view_08110.account_id} ;;
    required_joins: [view_08109]
  }

  join: view_08111 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08107.category} = ${view_08111.category} ;;
  }

  access_filter: {
    field: view_08107.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08107.is_deleted} = false ;;
}
