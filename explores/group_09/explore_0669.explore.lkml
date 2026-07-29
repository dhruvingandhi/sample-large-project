# Explore: explore_0669
# Auto-generated LookML Explore File

include: "/views/domain_08/view_02008.view.lkml"
include: "/views/domain_10/view_02010.view.lkml"
include: "/views/domain_11/view_02011.view.lkml"
include: "/views/domain_12/view_02012.view.lkml"

explore: explore_0669 {
  label: "Explore Explore 0669"
  description: "Comprehensive analytics explore joining base view_02008 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_02008
  
  always_filter: {
    filters: [view_02008.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02008.created_at_date: "7 days"]
    unless: [view_02008.id, view_02008.status]
  }

  join: view_02010 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02008.user_id} = ${view_02010.id} ;;
    required_joins: []
  }

  join: view_02011 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02008.account_id} = ${view_02011.account_id} ;;
    required_joins: [view_02010]
  }

  join: view_02012 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02008.category} = ${view_02012.category} ;;
  }

  access_filter: {
    field: view_02008.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02008.is_deleted} = false ;;
}
