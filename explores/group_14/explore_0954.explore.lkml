# Explore: explore_0954
# Auto-generated LookML Explore File

include: "/views/domain_13/view_02863.view.lkml"
include: "/views/domain_15/view_02865.view.lkml"
include: "/views/domain_16/view_02866.view.lkml"
include: "/views/domain_17/view_02867.view.lkml"

explore: explore_0954 {
  label: "Explore Explore 0954"
  description: "Comprehensive analytics explore joining base view_02863 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_02863
  
  always_filter: {
    filters: [view_02863.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02863.created_at_date: "7 days"]
    unless: [view_02863.id, view_02863.status]
  }

  join: view_02865 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02863.user_id} = ${view_02865.id} ;;
    required_joins: []
  }

  join: view_02866 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02863.account_id} = ${view_02866.account_id} ;;
    required_joins: [view_02865]
  }

  join: view_02867 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02863.category} = ${view_02867.category} ;;
  }

  access_filter: {
    field: view_02863.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02863.is_deleted} = false ;;
}
