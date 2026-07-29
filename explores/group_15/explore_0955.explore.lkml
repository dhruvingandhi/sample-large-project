# Explore: explore_0955
# Auto-generated LookML Explore File

include: "/views/domain_16/view_02866.view.lkml"
include: "/views/domain_18/view_02868.view.lkml"
include: "/views/domain_19/view_02869.view.lkml"
include: "/views/domain_20/view_02870.view.lkml"

explore: explore_0955 {
  label: "Explore Explore 0955"
  description: "Comprehensive analytics explore joining base view_02866 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_02866
  
  always_filter: {
    filters: [view_02866.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02866.created_at_date: "7 days"]
    unless: [view_02866.id, view_02866.status]
  }

  join: view_02868 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02866.user_id} = ${view_02868.id} ;;
    required_joins: []
  }

  join: view_02869 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02866.account_id} = ${view_02869.account_id} ;;
    required_joins: [view_02868]
  }

  join: view_02870 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02866.category} = ${view_02870.category} ;;
  }

  access_filter: {
    field: view_02866.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02866.is_deleted} = false ;;
}
