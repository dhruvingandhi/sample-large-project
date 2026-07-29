# Explore: explore_1954
# Auto-generated LookML Explore File

include: "/views/domain_13/view_05863.view.lkml"
include: "/views/domain_15/view_05865.view.lkml"
include: "/views/domain_16/view_05866.view.lkml"
include: "/views/domain_17/view_05867.view.lkml"

explore: explore_1954 {
  label: "Explore Explore 1954"
  description: "Comprehensive analytics explore joining base view_05863 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_05863
  
  always_filter: {
    filters: [view_05863.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05863.created_at_date: "7 days"]
    unless: [view_05863.id, view_05863.status]
  }

  join: view_05865 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05863.user_id} = ${view_05865.id} ;;
    required_joins: []
  }

  join: view_05866 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05863.account_id} = ${view_05866.account_id} ;;
    required_joins: [view_05865]
  }

  join: view_05867 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05863.category} = ${view_05867.category} ;;
  }

  access_filter: {
    field: view_05863.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05863.is_deleted} = false ;;
}
