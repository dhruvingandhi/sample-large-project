# Explore: explore_2034
# Auto-generated LookML Explore File

include: "/views/domain_03/view_06103.view.lkml"
include: "/views/domain_05/view_06105.view.lkml"
include: "/views/domain_06/view_06106.view.lkml"
include: "/views/domain_07/view_06107.view.lkml"

explore: explore_2034 {
  label: "Explore Explore 2034"
  description: "Comprehensive analytics explore joining base view_06103 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_06103
  
  always_filter: {
    filters: [view_06103.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06103.created_at_date: "7 days"]
    unless: [view_06103.id, view_06103.status]
  }

  join: view_06105 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06103.user_id} = ${view_06105.id} ;;
    required_joins: []
  }

  join: view_06106 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06103.account_id} = ${view_06106.account_id} ;;
    required_joins: [view_06105]
  }

  join: view_06107 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06103.category} = ${view_06107.category} ;;
  }

  access_filter: {
    field: view_06103.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06103.is_deleted} = false ;;
}
