# Explore: explore_3955
# Auto-generated LookML Explore File

include: "/views/domain_16/view_11866.view.lkml"
include: "/views/domain_18/view_11868.view.lkml"
include: "/views/domain_19/view_11869.view.lkml"
include: "/views/domain_20/view_11870.view.lkml"

explore: explore_3955 {
  label: "Explore Explore 3955"
  description: "Comprehensive analytics explore joining base view_11866 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_11866
  
  always_filter: {
    filters: [view_11866.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11866.created_at_date: "7 days"]
    unless: [view_11866.id, view_11866.status]
  }

  join: view_11868 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11866.user_id} = ${view_11868.id} ;;
    required_joins: []
  }

  join: view_11869 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11866.account_id} = ${view_11869.account_id} ;;
    required_joins: [view_11868]
  }

  join: view_11870 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11866.category} = ${view_11870.category} ;;
  }

  access_filter: {
    field: view_11866.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11866.is_deleted} = false ;;
}
