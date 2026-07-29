# Explore: explore_3287
# Auto-generated LookML Explore File

include: "/views/domain_12/view_09862.view.lkml"
include: "/views/domain_14/view_09864.view.lkml"
include: "/views/domain_15/view_09865.view.lkml"
include: "/views/domain_16/view_09866.view.lkml"

explore: explore_3287 {
  label: "Explore Explore 3287"
  description: "Comprehensive analytics explore joining base view_09862 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_09862
  
  always_filter: {
    filters: [view_09862.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09862.created_at_date: "7 days"]
    unless: [view_09862.id, view_09862.status]
  }

  join: view_09864 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09862.user_id} = ${view_09864.id} ;;
    required_joins: []
  }

  join: view_09865 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09862.account_id} = ${view_09865.account_id} ;;
    required_joins: [view_09864]
  }

  join: view_09866 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09862.category} = ${view_09866.category} ;;
  }

  access_filter: {
    field: view_09862.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09862.is_deleted} = false ;;
}
