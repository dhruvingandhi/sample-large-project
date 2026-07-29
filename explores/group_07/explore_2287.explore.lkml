# Explore: explore_2287
# Auto-generated LookML Explore File

include: "/views/domain_12/view_06862.view.lkml"
include: "/views/domain_14/view_06864.view.lkml"
include: "/views/domain_15/view_06865.view.lkml"
include: "/views/domain_16/view_06866.view.lkml"

explore: explore_2287 {
  label: "Explore Explore 2287"
  description: "Comprehensive analytics explore joining base view_06862 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_06862
  
  always_filter: {
    filters: [view_06862.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06862.created_at_date: "7 days"]
    unless: [view_06862.id, view_06862.status]
  }

  join: view_06864 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06862.user_id} = ${view_06864.id} ;;
    required_joins: []
  }

  join: view_06865 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06862.account_id} = ${view_06865.account_id} ;;
    required_joins: [view_06864]
  }

  join: view_06866 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06862.category} = ${view_06866.category} ;;
  }

  access_filter: {
    field: view_06862.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06862.is_deleted} = false ;;
}
