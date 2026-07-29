# Explore: explore_2303
# Auto-generated LookML Explore File

include: "/views/domain_10/view_06910.view.lkml"
include: "/views/domain_12/view_06912.view.lkml"
include: "/views/domain_13/view_06913.view.lkml"
include: "/views/domain_14/view_06914.view.lkml"

explore: explore_2303 {
  label: "Explore Explore 2303"
  description: "Comprehensive analytics explore joining base view_06910 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_06910
  
  always_filter: {
    filters: [view_06910.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06910.created_at_date: "7 days"]
    unless: [view_06910.id, view_06910.status]
  }

  join: view_06912 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06910.user_id} = ${view_06912.id} ;;
    required_joins: []
  }

  join: view_06913 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06910.account_id} = ${view_06913.account_id} ;;
    required_joins: [view_06912]
  }

  join: view_06914 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06910.category} = ${view_06914.category} ;;
  }

  access_filter: {
    field: view_06910.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06910.is_deleted} = false ;;
}
